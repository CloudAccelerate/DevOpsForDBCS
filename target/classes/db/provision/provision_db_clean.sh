#!/bin/bash
export DOMAIN=$2
export DOMAIN_USERNAME=$3
export DOMAIN_PASSWORD=$4
export DB_NAME=$1
export REST_ENDPOINT=$5

#Check Variable
echo "DOMAIN: ${DOMAIN}"
echo "DOMAIN_USERNAME: ${DOMAIN_USERNAME}"
echo "DOMAIN_PASSWORD: ${DOMAIN_PASSWORD}"
echo "DB_NAME: ${DB_NAME}"
echo "REST_ENDPOINT: ${REST_ENDPOINT}"

# ---------------------------- CREATE TEST INSTANCE ------------------------------------

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
