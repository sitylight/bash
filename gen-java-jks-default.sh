#!/bin/bash

alias='server'
keysize='2048'
keystore='server.jks'
validity='365'
password='123456'
dname="CN=DL,O=temp,L=ZH,ST=GD,C=CN"

echo "init alias: ${alias}, keysize: ${keysize}, keystore: ${keystore}, validity: ${validity}, password: ${password}"

keytool -genkeypair -alias ${alias} -keyalg RSA -dname ${dname} -keysize ${keysize} -keystore ${keystore} -validity ${validity} -storetype jks -storepass ${password} -keypass ${password}

# keytool -importkeystore -srckeystore server.jks -destkeystore server.jks -deststoretype pkcs12 -storepass ${password}

echo "${keystore} is generated"

