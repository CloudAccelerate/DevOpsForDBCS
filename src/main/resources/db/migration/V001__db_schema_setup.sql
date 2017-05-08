ALTER USER C##DEVOPSDEMO IDENTIFIED BY Welcome1#;
  
GRANT connect TO C##DEVOPSDEMO;
GRANT create session TO C##DEVOPSDEMO;
GRANT create table TO C##DEVOPSDEMO;
GRANT create view TO C##DEVOPSDEMO;
GRANT create any trigger TO C##DEVOPSDEMO;
GRANT create any procedure TO C##DEVOPSDEMO;
GRANT create sequence TO C##DEVOPSDEMO;
GRANT create synonym TO C##DEVOPSDEMO;

CREATE TABLE C##DEVOPSDEMO.catalog_items (
  name VARCHAR2(50) NOT NULL,
  description VARCHAR2(500) NULL,
  image CLOB NULL,
  price DECIMAL(15,2) NULL,
  CONSTRAINT catalog_items_pk PRIMARY KEY(name)
);

SELECT * FROM C##DEVOPSDEMO.catalog_items;

  INSERT INTO C##DEVOPSDEMO.catalog_items(name,description,image,price)VALUES
  ('Application Container Cloud Service',
  'Polyglot Development Platform in Oracle''s Cloud',
  'image1',
  60.00);
  
    INSERT INTO C##DEVOPSDEMO.catalog_items(name,description,image,price)VALUES
  ('Java Cloud Service',
  'Java EE Development Platform in Oracle''s Cloud',
  'image2',
  450.00);
  
    INSERT INTO C##DEVOPSDEMO.catalog_items(name,description,image,price)VALUES
  ('Mobile Cloud Service',
  'Mobile Backend as a Service for a Complete Mobile Development Platform in Oracle''s Cloud',
  'image3',
  2275.00);
  
    INSERT INTO C##DEVOPSDEMO.catalog_items(name,description,image,price)VALUES
  ('Developer Cloud Service',
  'Development Platform hosting all your development tools and services supporting your agile development needs in Oracle'' Cloud',
  'image4',
  0.00);
  
     INSERT INTO C##DEVOPSDEMO.catalog_items(name,description,image,price)VALUES
  ('Container Cloud Service',
  'Docker host platform to execute your full docker registry in Oracle''s Cloud',
  'image5',
  75.00);
  
     INSERT INTO C##DEVOPSDEMO.catalog_items(name,description,image,price)VALUES
  ('MySQL Cloud Service',
  'Fully featured MySQL Database in Oracle''s Cloud',
  'image6',
  130.00);
  
     INSERT INTO C##DEVOPSDEMO.catalog_items(name,description,image,price)VALUES
  ('Database Cloud Service',
  'Fully featured Oracle Database in Oracle''s Cloud',
  'image7',
  600.00);
  
     INSERT INTO C##DEVOPSDEMO.catalog_items(name,description,image,price)VALUES
  ('Compute Cloud Service',
  'Run on Infrastructure as a service in Oracle''s Cloud',
  'image8',
  75.00);