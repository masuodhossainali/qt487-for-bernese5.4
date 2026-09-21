docker build --network=host --no-cache -t bernese-qt487 .

docker create --name qt-tmp bernese-qt487
sudo rm -rf /opt/qt4.8.7
sudo docker cp qt-tmp:/opt/qt4.8.7 /opt/qt4.8.7
docker rm qt-tmp
