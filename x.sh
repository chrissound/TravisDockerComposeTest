echo "testing 123"
docker-compose --version

docker-compose up -d 


n=0
until [ $n -ge 24 ]
do
  curl $(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker-compose ps -q))
  n=$[$n+1]
  sleep 5
done
