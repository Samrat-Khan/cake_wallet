#!/bin/sh

APP_MACOS_NAME=""
APP_MACOS_VERSION=""
APP_MACOS_BUILD_VERSION=""
APP_MACOS_BUNDLE_ID=""

CAKEWALLET="cakewallet"

TYPES=($CAKEWALLET)
APP_MACOS_TYPE=$CAKEWALLET

if [ -n "$1" ]; then
	APP_MACOS_TYPE=$1
fi

CAKEWALLET_NAME="Cake Wallet"
CAKEWALLET_VERSION="1.3.5"
CAKEWALLET_BUILD_NUMBER=42
CAKEWALLET_BUNDLE_ID="com.fotolockr.cakewallet"

if ! [[ " ${TYPES[*]} " =~ " ${APP_MACOS_TYPE} " ]]; then
    echo "Wrong app type."
    exit 1
fi

case $APP_MACOS_TYPE in
	$CAKEWALLET)
		APP_MACOS_NAME=$CAKEWALLET_NAME
		APP_MACOS_VERSION=$CAKEWALLET_VERSION
		APP_MACOS_BUILD_NUMBER=$CAKEWALLET_BUILD_NUMBER
		APP_MACOS_BUNDLE_ID=$CAKEWALLET_BUNDLE_ID;;
esac

export APP_MACOS_TYPE
export APP_MACOS_NAME
export APP_MACOS_VERSION
export APP_MACOS_BUILD_NUMBER
export APP_MACOS_BUNDLE_ID
