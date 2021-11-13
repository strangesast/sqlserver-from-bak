If for some unfortunate reason you must use SQLServer, here's a way to create a
sqlserver instance with docker from a .bak file  

Place the `.bak` in `data/` and configure env variables  

build for multiple platforms  
```
# if necessary
docker buildx create --use

docker buildx bake --set \*.platform=linux/amd64,linux/arm64 -f docker-compose.yml
```
