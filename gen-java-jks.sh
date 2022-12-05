#!/bin/bash

alias='server'
keysize='2048'
keystore='server.jks'
validity='365'
password='123456'

echo "init alias: ${alias}, keysize: ${keysize}, keystore: ${keystore}, validity: ${validity}, password: ${password}"

PS3="select change element:"
echo $PS3

select i in 'alias' 'keysize' 'keystore' 'validity' 'password' 'genkey'
do
	case "${i}" in
		alias)
			echo "input new alias and enter:"
			read -p "[${alias}]" new_alias
			if [[ -n ${new_alias} ]]; then
				alias=${new_alias}
			fi
			;;
		keysize)
			echo "input new keysize and enter:"
			read -p "[${keysize}]" new_keysize
			if [[ -n ${new_keysize} ]]; then
				keysize=${new_keysize}
			fi
			;;
		keystore)
			echo "input new keystore and enter:"
			read -p "[${keystore}]" new_keystore
			if [[ -n ${new_keystore} ]]; then
				keystore=${new_keystore}
			fi
			;;
		validity)
			echo "input new validity and enter:"
			read -p "[${validity}]" new_validity
			if [[ -n ${new_validity} ]]; then
				validity=${new_validity}
			fi
			;;
		password)
			echo "input new password and enter:"
			read -p "[${password}]" new_password
			if [[ -n ${new_password} ]]; then
				password=${new_password}
			fi
			;;
		genkey)
			break
			;;

		*)
			continue
			;;
	esac
done

echo "genkey alias: ${alias}, keysize: ${keysize}, keystore: ${keystore}, validity: ${validity}, password: ${password}"


keytool -genkeypair -alias ${alias} -keyalg RSA -keysize ${keysize} -keystore ${keystore} -validity ${validity} -storetype jks -storepass ${password} -keypass ${password}

echo "${keystore} is generated"
