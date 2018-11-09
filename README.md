# Mongoshells Dockerfiles
This repository aims to store lites and simple mongoshell images. That means these images will not run mongod service, but only allows to connect to any mongo database. 

While browsing the web looking for a such a system, I could find noone so built my own. It is fairly basic and aims for minimalist and very small images. One of the goal being to execute mongo batches on Cloud Provided Mongo services where every little bit of data is billed to the end-user.

Feel free to comment, correct, whatever you feel necessary.
If by doing this I am actually stealing someone property, or breaking any law, please just let me know and I will remove the code as soon as possible.

Regards

## Guidelines

I have looked for a way to update a database through mongoshell while keeping track of my version. I have adopted a very simple system with three numbers to keep track of my version : 

- Major version (or build)
- Minor version (or feature)
- Corrective version (or bug)

This ends up with a version table such as : 3.4.1 where 3 stands for the major version, 4 for the minor one, and 1 for the corrective one.

These scripts are stored in the version folder, before you build a version, you must copy them in the targeted folder.
