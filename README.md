# Mongoshells Dockerfiles
This repository aims to store lites and simple mongoshell images. That means these images will not run mongod service, but only allows to connect to any mongo database. I was initially looking at a way to update my database with a lite image. 

While browsing the web looking for a such a system, I could not find any, so built my own. It is fairly basic and aims for minimalist and very small images. One of the goal being to execute mongo batches on Cloud Provided Mongo services where every little bit of data is billed to the end-user.

I added a basic system to update a database while keeping tracks of version so only newer scripts than current database version are loaded. While it is far from perfect, I find it simple enough to use for my personnal needs. 

Feel free to comment, correct, whatever you feel necessary by any means.
If by doing this I am actually stealing someone property, or breaking any law, please just let me know and I will remove the code as soon as possible.

Regards

## Guidelines

### Version management

I have looked for a way to update a database through mongoshell while keeping track of my version. I have adopted a very simple system with three numbers to keep track of my version : 

- Major version (or build)
- Minor version (or feature)
- Corrective version (or bug)

This ends up with a version table such as : 3.4.1 where 3 stands for the major version, 4 for the minor one, and 1 for the corrective one.

These scripts are stored in the version folder, before you build a version, you must copy them in the targeted folder.

In order to run the script, you must provide in your mongoshell docker service four environment variables : 
- HOSTNAME_DB : the address of the database (localhost, 192.168.0.1, 172.22.6.1, my-mongo-db.inner.address are possible examples)
- DB_NAME : the name of the database you wish to update
- USER : the name of the user you plan to log in mongo with
- PASSWORD : the password of the user you plan to log in mongo with (security breach for now, I'll fix it very soon once the whole thing is stabilized)

### Running exemple
Let suppose I want to execute my container on a remote MongoDB Base located at the following address : "my.mongo.db.address".
Let suppose the database name is the following : "MyAlternativeUPPERcaselowerCASE_DB"

We will assume you have already tested and your database is up, running and available from your current container runner.

I should then run my container with the following settings (we will assume you are currently located at the root of this project) : 

```bash
cp version/* 4.0/.
docker build -t mongo-shell-example -f Dockerfile .
docker run -e HOSTNAME_DB=my.mongodb.address -e DB_NAME=MyAlternativeUPPERcaselowerCASE_DB -e USER=toto -e PASSWORD=tata mongo-shell-example
```
