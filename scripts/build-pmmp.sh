#!/bin/sh

mkdir build libs
cp -r src resources plugin.yml build/

#Download pmp libs
wget -q -O php_libs.tar.gz http://play.fallentech.io/main/php/PHP_7.4.tar.gz
tar -xf php_libs.tar.gz -C libs/

#Download and make executable build script
wget -q -O BuildScript.php https://gist.githubusercontent.com/Infernus101/aed6e01cf10c1f6ea896aa0fdf1cbd1b/raw/e7b174cd8d8545a202cbe86bc78cd2c2590cb3fe/pmmp-devtools
chmod +x BuildScript.php

#Build phar
libs/bin/php7/bin/php -dphar.readonly=0 BuildScript.php --make build --out FormAPI.phar
