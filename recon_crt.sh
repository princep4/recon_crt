#!/bin/bash

TARGET="$1"

if [ -z $TARGET ]; then
	echo -e "            _         _     "
	echo -e "   ___ _ __| |_   ___| |__  "
	echo -e "  / __| '__| __| / __| '_ \ "
	echo -e " | (__| |  | |_ _\__ \ | | |"
	echo -e "  \___|_|   \__(_)___/_| |_|"
  	echo ""
	exit
fi

if [[ $TARGET = "--help" ]]; then
	echo -e "            _         _     "
	echo -e "   ___ _ __| |_   ___| |__  "
	echo -e "  / __| '__| __| / __| '_ \ "
	echo -e " | (__| |  | |_ _\__ \ | | |"
	echo -e "  \___|_|   \__(_)___/_| |_|"
  	echo ""
	exit
fi

echo -e "            _         _     "
echo -e "   ___ _ __| |_   ___| |__  "
echo -e "  / __| '__| __| / __| '_ \ "
echo -e " | (__| |  | |_ _\__ \ | | |"
echo -e "  \___|_|   \__(_)___/_| |_|"
echo ""

echo -e " %%%%%%%%%%%%%% [Gathering Subdomains]=%%%%%%%%%%%%%"
curl -s https://crt.sh/?q=%25.$TARGET > /tmp/curl.out
cat /tmp/curl.out | grep $TARGET | grep TD | sed -e 's/<//g' | sed -e 's/>//g' | sed -e 's/TD//g' | sed -e 's/\///g' | sed -e 's/ //g' | sed -n '1!p' | sort -u > crt.$TARGET.txt
cat crt.$TARGET.txt
echo -e " File saved to: crt.$TARGET.txt"
echo -e "%%%%%%%%%%%%%%%%%%%%%% [Done] %%%%%%%%%%%%%%%%%%%%%"
