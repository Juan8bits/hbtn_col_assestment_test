CREATE DATABASE IF NOT EXISTS hast;
USE hast;

DROP TABLE IF EXISTS 'Users';
CREATE TABLE 'Users' (
  'id' INT unsigned NOT NULL AUTO_INCREMENT,
  'name' varchar(255) default NULL,
  'last_name' varchar(255) default NULL,
  'gov_id' varchar(16) NOT NULL,
  'email' varchar(255) default NULL,
  PRIMARY KEY ('id')
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

INSERT INTO 'Users' ('id','name','last_name','gov_id','email') VALUES (0,"Quynn","Merritt","A730439117401","metus@lobortismauris.ca"),(10,"Kelsey","Riley","B618471173478","urna.Nullam.lobortis@famesac.com"),(20,"Carissa","Lois","D463619655468","orci.luctus.et@ornare.co.uk"),(30,"Kasimir","Sybill","F611007489793","id@metusIn.ca"),(40,"Chadwick","Noble","H743698646700","dapibus.id.blandit@sitamet.com");
INSERT INTO 'Users' ('id','name','last_name','gov_id','email') VALUES (50,"Porter","Joelle","542910989577","nibh.vulputate@anteipsumprimis.com"),(60,"Ainsley","Gannon","C597600669854","lacus.Cras@odiovelest.com"),(70,"Miranda","Alana","E808225359444","erat@purusin.org"),(80,"Devin","Brenna","G265285184351","mollis.non@inlobortistellus.co.uk"),(90,"Byron","Yael","I325324119041","Maecenas@faucibusut.ca");

DROP TABLE IF EXISTS 'Orders';
CREATE TABLE 'Orders' (
  'id' INT unsigned NOT NULL AUTO_INCREMENT,
  'date' varchar(255),
  'total' varchar(16) default NULL,
  'subtotal' varchar(16) default NULL,
  'taxes' INT unsigned,
  'paid' varchar(16) default NULL,
  PRIMARY KEY ('id')
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

INSERT INTO 'Orders' ('id','date','total','subtotal','taxes','paid') VALUES (0,"11/30/2021","$502.80","$437.22",15,"$228.48"),(1,"09/24/2021","$652.64","$557.81",17,"$134.49");
INSERT INTO 'Orders' ('id','date','total','subtotal','taxes','paid') VALUES (2,"12/30/2019","$620.25","$539.35",15,"$620.25"),(3,"11/11/2019","$90.09","$77.67",16,"$90.09");
INSERT INTO 'Orders' ('id','date','total','subtotal','taxes','paid') VALUES (4,"11/16/2019","$118.91","$102.51",16,"$0.00"),(5,"09/21/2021","$432.11","$375.75",15,"$432.11");
INSERT INTO 'Orders' ('id','date','total','subtotal','taxes','paid') VALUES (6,"01/21/2020","$15.78","$13.26",19,"$10.65"),(7,"07/12/2020","$165.77","$142.91",16,"$0.00");

DROP TABLE IF EXISTS 'Payment';
CREATE TABLE 'Payment' (
  'txn_id' INT unsigned NOT NULL AUTO_INCREMENT,
  'type' varchar(64)
  'date' varchar(255),
  'total' varchar(16) default NULL,
  'status' BOOLEAN,
  'order_id' FOREIGN KEY REFERENCES 'Orders' ('id'),
  PRIMARY KEY ('txn_id')
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

INSERT INTO 'Payment' ('txn_id','order_id','type','date','total','status') VALUES (0,0,"CASH","11/30/2021","$228.48",true), (1,0,"CASH","12/06/2021","$100.00",false);
INSERT INTO 'Payment' ('txn_id','order_id','type','date','total','status') VALUES (2,1,"CREDITCARD","09/24/2021","$500.00",true), (3,1,"CASH","09/26/2021","$57.81",true);
INSERT INTO 'Payment' ('txn_id','order_id','type','date','total','status') VALUES (4,2,"PSE","01/12/2020","$400.00",true), (5,2,"CREDITCARD","02/05/2020","$139.35",true);
INSERT INTO 'Payment' ('txn_id','order_id','type','date','total','status') VALUES (6,3,"PSE","11/11/2019","$90.09",true);
INSERT INTO 'Payment' ('txn_id','order_id','type','date','total','status') VALUES (7,4,"PSE","11/18/2019","$118.91", false), (8,4,"CREDITCARD","11/18/2019","$118.91",false);
INSERT INTO 'Payment' ('txn_id','order_id','type','date','total','status') VALUES (9,5,"CREDITCARD","09/24/2021","$120.00",true), (10,5,"CASH","09/26/2021","$120.00",true), (11,5,"PSE","09/27/2021","$192.11",true);
INSERT INTO 'Payment' ('txn_id','order_id','type','date','total','status') VALUES (12,6,"CASH","01/21/2020","$10.65",true);

/* Should the shipping cost be include in Total value of the every oder?*/
DROP TABLE IF EXISTS 'Shipping';
CREATE TABLE 'Shipping' (
  'address' varchar(255),
  'city' varchar(255),
  'state' varchar(255)
  'country' varchar(255),
  'cost' varchar(16) default NULL,
  'order_id' FOREIGN KEY REFERENCES 'Orders' ('id'),
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO 'Shipping' ('address','city','state','country','cost','order_id') VALUES ("836-2454 Suspendisse Calle","Villavicencio","MET","Saint Kitts and Nevis","$59.31",0),("Apartado núm.: 356, 8591 Augue Avda.","San Andrés","San Andrés y Providencia","Mali","$95.10",1),("Apartado núm.: 852, 3288 Purus. Calle","Saravena","ARA","Bonaire, Sint Eustatius and Saba","$93.09",2),("314-6707 Ipsum. C.","Soacha","CUN","Yemen","$53.38",3);
INSERT INTO 'Shipping' ('address','city','state','country','cost','order_id') VALUES ("817-1122 Ipsum. C/","Dosquebradas","RIS","Mexico","$50.48",4),("Apdo.:146-1065 Erat Calle","San Andrés","SAP","United States","$93.81",5),("602-6037 Mi. Avenida","Riosucio","CAL","Guatemala","$6.07",6),("208-1719 Semper Carretera","Magangué","Bolívar","Namibia","$9.50",7);

/* Advantages of a bridge table according to relation 1:M 
  Should i fill the table manually?
*/
DROP TABLE IF EXISTS 'bridge_users_orders';
CREATE TABLE 'bridge_users_orders' (
  'user_id' INT unsigned NOT NULL,
  'order_id' INT unsigned NOT NULL,
  KEY 'user_id' ('user_id'),
  KEY 'order_id' ('order_id'),
  CONSTRAINT 'bridge_users_orders_ibfk_0' FOREIGN KEY ('user_id') REFERENCES 'Users' ('id'),
  CONSTRAINT 'bridge_users_orders_ibfk_1' FOREIGN KEY ('order_id') REFERENCES 'Orders' ('id'),
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- DROP TABLE IF EXISTS 'bridge_orders_payment';
-- CREATE TABLE 'bridge_orders_payment' (
--   'order_id' INT unsigned NOT NULL,
--   'payment_id' INT unsigned NOT NULL,
--   KEY 'oder_id' ('order_id'),
--   KEY 'payment_id' ('payment_id'),
--   CONSTRAINT 'bridge_orders_payment_ibfk_0' FOREIGN KEY ('order_id') REFERENCES 'Orders' ('id'),
--   CONSTRAINT 'bridge_orders_payment_ibfk_1' FOREIGN KEY ('payment_id') REFERENCES 'Payment' ('txn_id'),
-- )
