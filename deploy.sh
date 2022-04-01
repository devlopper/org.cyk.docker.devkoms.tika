sudo docker build -t "cyk/logicalspark/tika:2.3.0" .
sudo docker container rm -f cyk-tika
sudo docker docker create --name cyk-tika -m 2G --restart always -v ${pwd}:/config -v /home/kwordz/files:/home/kwordz/files cyk/logicalspark/tika:2.3.0 -c ./config.xml
sudo docker start cyk-tika