sudo docker build -t "cyk/logicalspark/tika:2.3.0" .

if [ -z `docker ps -aq --filter "name=cyk-tika"` ]; then
  echo "Container cyk-tika does not exist."
else
  docker container rm -f cyk-tika
  echo "Container cyk-tika has been removed."
fi

sudo docker docker create --name cyk-tika -m 2G --restart always -v ${pwd}:/config -v /home/kwordz/files:/home/kwordz/files cyk/logicalspark/tika:2.3.0 -c ./config.xml
sudo docker start cyk-tika