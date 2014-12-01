#!/bin/sh
 
#  build.Script.sh
#  xxxx
#
#  Created by soyi on 12-1-16.
#  Copyright (c) 2012年 xxxx. All rights reserved.
 
 
distDir="/Users/michael/Desktop/dist"
releaseDir="./build/"
version="1_5_0"                                                 #发布的版本号
rm -rdf "$distDir"
mkdir "$distDir"
rm -rdf "$releaseDir"
for line in $(cat channel)                                  #读取所有渠道号channel文件 如:  appstore:10001 {渠道名:渠道号}
do
ipafilename=`echo $line|cut -f1 -d':'`                 #渠道名
sourceid=`echo $line|cut -f2 -d':'`                      #渠道号
xcodebuild clean -configuration "Distribution_${ipafilename}"      #clean项目
echo "ipafilename=$ipafilename"
echo "sourceid=$sourceid"
targetName="xxxx"                                       #项目名称(xcode左边列表中显示的项目名称)
 
 
ipapath="${distDir}/${targetName}_${version}_for_${sourceid}.ipa"
 
echo "***开始build app文件***"
xcodebuild -project xxxx.xcodeproj -target "$targetName" -configuration "Distribution_${ipafilename}"  -sdk iphoneos5.0 build
appfile="${releaseDir}Distribution_${ipafilename}-iphoneos/${targetName}.app"
cd ${releaseDir}Distribution_${ipafilename}-iphoneos/
zip -r "${targetName}_${ipafilename}_${version}.zip" "${targetName}.app"
cd ..
cd ..
echo "***开始打ipa渠道包****"
/usr/bin/xcrun -sdk iphoneos5.0 PackageApplication -v "$appfile" -o "$ipapath" --sign "iPhone Distribution: xxxxx company"
done
