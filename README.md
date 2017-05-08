# DevOpsForDBCS

Welcome to the DBCS DevOps Demo Application. This Demo is designed to be used in conjunction with a Developer Cloud Service instance.

## Setup Steps

### Step 1: Create a Developer CLoud Service Instance Project

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

