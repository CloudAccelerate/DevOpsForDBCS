![](https://cloudaccelerate.github.io/TTC-CommonContent/images/ttc-logo.png)

# DevOps For DBCS

Welcome to the DBCS DevOps Demo Application. This Demo is designed to be used in conjunction with a Developer Cloud Service instance.

## Setup Steps

### Step 1: Create a Developer CLoud Service Instance Project

#### Login in to your cloud services dashbaord

#### Open the developer service console

#### Create a new empty project

### Step 2: Setup a provisioning build

Here we will be defining the build for provisioning new DBCS instances. 

#### Create a build

Name your build: DevOpsProvisioningDB

#### Create Parameters

Fill in all the paraemters with default values to make it easier


```
String Paramter
  Name: DB_NAME
  Default Value: DevOpsDemoDB

String Parameter
  Name: DOMAIN_USERNAME
  Default Value: <user name> ex: cloud.admin
  
Password Parameter
  Name: DOMAIN_PASSWORD
  Default Value: <domain password>
  
String Paramter
  Name: DOMAIN
  Default Value: <your domain> ex: gse00001984
  
String Paramter
  Name: REST_ENDPOINT
  Default Value: <your datacenter rest endpoint with https stripped out> ex: psm.europe.oraclecloud.com
```


#### Build Step
Add a shell build step and copy int he following script:

```shell
curl -X POST \
-u "${DOMAIN_USERNAME}:${DOMAIN_PASSWORD}" \
-H "X-ID-TENANT-NAME:${DOMAIN}" \
-H "Content-Type:application/json" \
-d '{
  "description": "DevOps Provisioned",
  "edition": "EE_HP",
  "level": "PAAS",
  "serviceName": "'${DB_NAME}'",
  "shape": "oc3",
  "subscriptionType": "MONTHLY",
  "version": "12.1.0.2",
  "vmPublicKeyText": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCmoFk1l0rlKwY3o9q3U5EGwpDUyPmjbSj8FOWA5F4obT9Mgw8WVan90czweMSveEiXEq9duD3Q6j7QlDgxGJGhzkSBgn3E3RIn4LWUbv6U6/T0SDh1cYr4Cxgp17mF4Ic7RFLzV2WYNTMkLcqfzUvfIvB4M9gE/3b0A6Lvw0PDJFM9ZzXG3fdU8YIeyMijHPwryvyRRl9/u6jZWwdLGG2kT8Eeyu1MENcZDrX6dIQ7/TwLdz06sYbwxfPIHDY/VQ3UgUya3dF0jloxF8E9Be61UZveJJCra9+MsnZGgVEM5dQJqbnMWQaZ1eLgniR9UbRuKbj5lcL6HakzXdtqkV9D dcameron@dcameron-linux",
  "parameters": [{
    "type": "db",
    "usableStorage": "15",
    "adminPassword": "Welcome1#",
    "sid": "ORCL",
    "pdbName": "MYPDB",
    "failoverDatabase": "no",
    "backupDestination": "NONE"
    }]
}' https://${REST_ENDPOINT}/paas/service/dbcs/api/v1.1/instances/${DOMAIN}
```

### Step 2 - Load Oracle DB jar

#### Got to the maven tab and upload a jar

upload the ojdbc7 jar


```
artifactId: ojdbc7
version: 0.0.1
groupID: oracle.com

<dependency>
  <groupId>com.oracle</groupId>
  <artifactId>ojdbc7</artifactId>
  <version>0.0.1</version>
  <type>jar</type>
</dependency>
```

Your jar should now be installed into the main maven repository

### Step 3 - Load the code

#### Create a new repo
Load in the repo code


```
Name: DevOpsDBCSApp
repo: https://github.com/CloudAccelerate/DevOpsForDBCS.git
```

#### Add maven repo

You'll have to checkout the code from the repo into your editor of choice. Add from the maven tab the remote repository


```
<repositories>
    <repository>
        <id>DevOps for DBCS_repo</id>
        <name>DevOps for DBCS Maven Repository</name>
        <url>https://developer.em2.oraclecloud.com/profile/developer66451-gse00001984/s/developer66451-gse00001984_devops-for-dbcs_5412/maven/</url>
    </repository>
</repositories>
```

### Step 3 - Build a SQL Migration Build

Here we will build an automated process using flywaydb to migrate a schema forward using scripts checked into the git source code repo for a specific application.

#### Create a Build
Name the Build: 

```
MigrateDB-DemoApp
```
#### Build Parameters


```
String Parameter
  Name: flyway.url
  Default Value: <jdbc with your IP> ex: jdbc:oracle:thin:@140.86.32.134:1521:ORCL

String Parameter
  Name: flyway.user
  Default Value: system
  
Password Parameter
  Name: flyway.password
  Default Value: Welcome1#
  
String Parameters
  Name: flyway.shemas
  Default Value: C##DEVOPSDEMO
```

#### Git Tab

Select the Master branch of the GIT repo

#### Built Step

Add a maven 3 build step


```
target: clean flayway:migrate
```

