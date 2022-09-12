#!/bin/bash

RED='\033[1;31m'

GREEN='\033[1;32m'

NC='\033[0m'

echo -e " ${GREEN} Build Flutter App ${NC} "
echo -e " ${GREEN} Increase version ${NC} "

perl -i -pe 's/^(version:\s+\d+\.\d+\.)(\d+)(\+)(\d+)$/$1.($2+1).$3.($4+1)/e' pubspec.yaml

echo ""
echo ""
echo -e " ${GREEN} Would you like to build for ANDROID Y/N ? ${NC} "
read resp

if [ $resp == "Y" ] || [ $resp == "y" ]; then
	echo " "
	echo -e " ${GREEN} Would you like to build apk or bundle?  A/B ${NC} "
	read bResp
  
  if [ $bResp == "A" ] || [ $bResp == "a" ]; then
    echo " "
    echo -e " ${GREEN} Split per ABI?  Y/N ${NC} "
    read sResp
    if [ $resp == "Y" ] || [ $resp == "y" ]; then
      echo " " 
      echo "Building splitted APK" 
      flutter build apk --release --split-per-abi
    fi
    
    if [ $resp == "N" ] || [ $resp == "n" ]; then
      echo " " 
      echo "Building APK" 
      flutter build apk --release
    fi
  fi 
  
  if [ $bResp == "B" ] || [ $bResp == "b" ]; then
    echo " "
    echo -e " build appbundle "
    flutter build appbundle
  fi 
  
fi

echo -e " ${GREEN} Would you like to build for IOS Y/N ? ${NC} "
read resp

if [ $resp == "Y" ] || [ $resp == "y" ]; then
	echo " "
  echo "Building IOS" 
  flutter build ios --release
fi

echo -e " ${GREEN} Would you like to build for WINDOWS Y/N ? ${NC} "
read resp

if [ $resp == "Y" ] || [ $resp == "y" ]; then
	echo " "
  echo "Building windows" 
  flutter build windows --release
fi

echo -e " ${GREEN} Would you like to build for LINUX Y/N ? ${NC} "
read resp

if [ $resp == "Y" ] || [ $resp == "y" ]; then
	echo " "
  echo "Building linux" 
  flutter build windows --release
fi


echo -e " ${GREEN} Would you like to build for MAC Y/N ? ${NC} "
read resp

if [ $resp == "Y" ] || [ $resp == "y" ]; then
	echo " "
  echo "Building MACOS" 
  flutter build macos --release
fi


echo -e " ${GREEN} Should you build for WEB Y/N ? ${NC} "
read resp

if [ $resp == "Y" ] || [ $resp == "y" ]; then
	echo " "
  echo "Building WEB" 
  flutter build web
fi

echo -e " ${GREEN} All Done. You can find builds in build folder ${NC} "
