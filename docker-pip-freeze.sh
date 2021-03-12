docker pull $1
id=$(docker run -td $1)
docker exec -ti $id pip freeze
docker stop $id
