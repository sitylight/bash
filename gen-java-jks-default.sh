#!/bin/bash

alias='server'
keysize='2048'
keystore='server.jks'
validity='365'
password='123456'

echo "init alias: ${alias}, keysize: ${keysize}, keystore: ${keystore}, validity: ${validity}, password: ${password}"

keytool -genkeypair -alias ${alias} -keyalg RSA -keysize ${keysize} -keystore ${keystore} -validity ${validity} -storetype jks -storepass ${password} -keypass ${password}

echo "${keystore} is generated"
