git fetch
git reset --hard origin
sudo docker build -t "cyk/logicalspark/tika:2.3.0" .

if [ -z `docker ps -aq --filter "name=cyk-tika"` ]; then
  echo "Container cyk-tika does not exist."
else
  docker container rm -f cyk-tika
  echo "Container cyk-tika has been removed."
fi

sudo docker create --name cyk-tika -m 2G --restart always -v /home/tika:/config -v /home/kwordz/files:/home/kwordz/files cyk/logicalspark/tika:2.3.0 -c ./config/tika-config.xml
sudo docker start cyk-tika