#!/usr/bin/env bash

set -ev

nuspec='windows/bin/choco/headset.nuspec'
chocoInstall='windows/bin/choco/tools/chocolateyInstall.ps1'

sed -i "s|<version>\(.*\)</version>|<version>$VERSION</version>|" $nuspec
sed -i "1s|.*|\$version = '$VERSION'|" $chocoInstall
sed -i '1s|^|\xef\xbb\xbf|' $chocoInstall
