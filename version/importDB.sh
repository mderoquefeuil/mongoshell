#!/bin/sh
version_gt() { test $(echo "$@" | tr " " "\n" | sort -V | head -n 1) != "$1"; }
is_number() { echo "$1" | egrep -q '^[0-9]+$'; }

# target bdd knows the login to apply (if needed) and the db address we want to reach
target_bdd=$HOSTNAME_DB/$DB_NAME
# If we set a user, we assume we set a password as well, and all this in the connecting command part
if [ ! -z $USER ]; then
  target_bdd="$target_bdd -u $USER -p $PASSWORD"
fi

echo "uploading data into $target_bdd"
cd /tmp/$DB_NAME
cp /tmp/*.js .

echo "We retrieve and check the current version" 
mongo $target_bdd secure-mongo-import.js
mongo --quiet $target_bdd secure-mongo-import.js > var_mongo
. ./var_mongo
rm -f ./var_mongo
echo "The current version is $BUILD.$FEATURE.$BUG"

if is_number $BUILD && is_number $FEATURE && is_number $BUG; then
  echo "Version name is valid"
else 
  echo "Version name is invalid, it must be updated"
  mongo --quiet $target_bdd create-version.js
  mongo --quiet $target_bdd secure-mongo-import.js > var_mongo
  . ./var_mongo
  rm -f ./var_mongo
  echo "Version is now $BUILD.$FEATURE.$BUG"
fi

liste_volumes=$(find . -mindepth 1 -type d -exec basename {} \; | sort --version-sort --field-separator=- --key=1,2 | sed 's/[^ ]* //' | tr ";" "\n")
for i in $liste_volumes
do
 :
    echo "We compare current version $BUILD.$FEATURE.$BUG and the one we found scripts : $i"
    if version_gt "$i" "$BUILD.$FEATURE.$BUG"
	then 
	    echo "We get into the folder $i"
		for file in ./$i/*.js
		do
		  :
		  echo "We load the file $file"
		  mongo --quiet $target_bdd $file
		done
		mongo --quiet $target_bdd --eval "var vers=\"$i\"" update-version.js
	fi
done

