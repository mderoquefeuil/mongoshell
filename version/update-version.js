try {
	print("== MAJ DE LA VERSION EN "+vers+" ==");
	versionArray=vers.split(".");
	if (versionArray.length === 3) {
		db.getCollection("version").update({},{"build":versionArray[0],"feature":versionArray[1],"bug":versionArray[2]});
	} else {
		throw "La version n'a pas le bon format";
	}
} catch (e) {
	print("Une erreur a eu lieu lors de la MAJ de la version");
}
