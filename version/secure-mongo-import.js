try {
	print('export BUILD='+db.getCollection("version").find().toArray()[0].build);
	print('export FEATURE='+db.getCollection("version").find().toArray()[0].feature);
	print('export BUG='+db.getCollection("version").find().toArray()[0].bug);
} catch (e) {
	print("echo \"La version n'a pas pu être déterminée\"");
}
