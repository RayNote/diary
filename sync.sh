#!/bin/bash

echo 'Sync blog repo'
git pull
git add *
git commit -a -m "update blog"
git push origin hugo

echo 'Gen site'
hugo
cd ../public

echo 'Update site'
git pull
cd ..
mv public old_public   #remove everything but .git
cp -r research_note/public .
cp -r old_public/.git public
cd public 
git add .
git commit -a -m "update"
git push origin master

echo 'Remove old site'
rm -rf ../old_public
