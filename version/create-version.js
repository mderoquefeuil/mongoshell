try {
	db.createCollection("version")
	db.getCollection("version").insert({"build":0,"feature":0,"bug":0});
} catch (e) {
	print("Une erreur a eu lieu lors de la création de la version");
}
