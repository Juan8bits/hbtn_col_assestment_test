DROP DATABASE IF EXISTS hast;
CREATE DATABASE hast;

DROP TABLE IF EXISTS hast.Users;
CREATE TABLE hast.Users (
  id INT unsigned PRIMARY KEY NOT NULL UNIQUE,
  first_name varchar(255) default NULL,
  last_name varchar(255) default NULL,
  gov_id varchar(16) NOT NULL,
  email varchar(255) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO hast.Users VALUES (0,"Quynn","Merritt","A730439117401","metus@lobortismauris.ca"),(1,"Kelsey","Riley","B618471173478","urna.Nullam.lobortis@famesac.com"),(2,"Carissa","Lois","D463619655468","orci.luctus.et@ornare.co.uk"),(3,"Kasimir","Sybill","F611007489793","id@metusIn.ca"),(4,"Chadwick","Noble","H743698646700","dapibus.id.blandit@sitamet.com");
INSERT INTO hast.Users VALUES (5,"Porter","Joelle","542910989577","nibh.vulputate@anteipsumprimis.com"),(6,"Ainsley","Gannon","C597600669854","lacus.Cras@odiovelest.com"),(7,"Miranda","Alana","E808225359444","erat@purusin.org"),(8,"Devin","Brenna","G265285184351","mollis.non@inlobortistellus.co.uk"),(9,"Byron","Yael","I325324119041","Maecenas@faucibusut.ca");

DROP TABLE IF EXISTS hast.Orders;
CREATE TABLE hast.Orders (
  id INT unsigned PRIMARY KEY NOT NULL UNIQUE,
  user_id INT unsigned NOT NULL,
  date varchar(255),
  total varchar(16) default NULL,
  subtotal varchar(16) default NULL,
  taxes INT unsigned,
  paid varchar(16) default NULL,
  FOREIGN KEY(user_id) REFERENCES hast.Users(id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO hast.Orders VALUES (0,0,"11/30/2021","$502.80","$437.22",15,"$228.48"),(1,1,"09/24/2021","$652.64","$557.81",17,"$134.49");
INSERT INTO hast.Orders VALUES (2,2,"12/30/2019","$620.25","$539.35",15,"$620.25"),(3,3,"11/11/2019","$90.09","$77.67",16,"$90.09");
INSERT INTO hast.Orders VALUES (4,4,"11/16/2019","$118.91","$102.51",16,"$0.00"),(5,5,"09/21/2021","$432.11","$375.75",15,"$432.11");
INSERT INTO hast.Orders VALUES (6,6,"01/21/2020","$15.78","$13.26",19,"$10.65"),(7,7,"07/12/2020","$165.77","$142.91",16,"$0.00");

DROP TABLE IF EXISTS hast.Payment;
CREATE TABLE hast.Payment (
  txn_id INT unsigned PRIMARY KEY NOT NULL,
  order_id INT unsigned not NULL,
  type varchar(64),
  date varchar(255),
  total varchar(16) default NULL,
  status BOOLEAN,
  FOREIGN KEY(order_id) REFERENCES hast.Orders(id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO hast.Payment VALUES (0,0,"CASH","11/30/2021","$228.48",true), (1,0,"CASH","12/06/2021","$100.00",false);
INSERT INTO hast.Payment VALUES (2,1,"CREDITCARD","09/24/2021","$500.00",true), (3,1,"CASH","09/26/2021","$57.81",true);
INSERT INTO hast.Payment VALUES (4,2,"PSE","01/12/2020","$400.00",true), (5,2,"CREDITCARD","02/05/2020","$139.35",true);
INSERT INTO hast.Payment VALUES (6,3,"PSE","11/11/2019","$90.09",true);
INSERT INTO hast.Payment VALUES (7,4,"PSE","11/18/2019","$118.91", false), (8,4,"CREDITCARD","11/18/2019","$118.91",false);
INSERT INTO hast.Payment VALUES (9,5,"CREDITCARD","09/24/2021","$120.00",true), (10,5,"CASH","09/26/2021","$120.00",true), (11,5,"PSE","09/27/2021","$192.11",true);
INSERT INTO hast.Payment VALUES (12,6,"CASH","01/21/2020","$10.65",true);

/* Should the shipping cost be include in Total value of the every oder?*/
DROP TABLE IF EXISTS hast.Shipping;
CREATE TABLE hast.Shipping (
  address varchar(255),
  city varchar(255),
  state varchar(255),
  country varchar(255),
  cost varchar(16) default NULL,
  order_id INT unsigned not NULL,
  FOREIGN KEY(order_id) REFERENCES hast.Orders(id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO hast.Shipping VALUES ("836-2454 Suspendisse Calle","Villavicencio","MET","Saint Kitts and Nevis","$59.31",0),("Apartado núm.: 356, 8591 Augue Avda.","San Andrés","San Andrés y Providencia","Mali","$95.10",1),("Apartado núm.: 852, 3288 Purus. Calle","Saravena","ARA","Bonaire, Sint Eustatius and Saba","$93.09",2),("314-6707 Ipsum. C.","Soacha","CUN","Yemen","$53.38",3);
INSERT INTO hast.Shipping VALUES ("817-1122 Ipsum. C/","Dosquebradas","RIS","Mexico","$50.48",4),("Apdo.:146-1065 Erat Calle","San Andrés","SAP","United States","$93.81",5),("602-6037 Mi. Avenida","Riosucio","CAL","Guatemala","$6.07",6),("208-1719 Semper Carretera","Magangué","Bolívar","Namibia","$9.50",7);
