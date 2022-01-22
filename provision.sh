#!/bin/bash

update packages
sudo apt-get update -y &
process_id=$!
echo "PID: $process_id  Actualizando repositorios"
wait $process_id
echo "Exit status: $? : Finalizazo el proceso de actualizacion de repositorios"

###Installing NodeJs
####################
sudo apt-get install nodejs -y &
process_id=$!
echo "PID: $process_id  Instalando Nodejs"
sleep 1
wait $process_id
echo "Exit status: $? : Finalizazo el proceso de Instalacion Nodejs"
versionNode=$(node -v)
echo "Version de Node $versionNode"
sleep 5

###Installing npm
###################
sudo apt-get install npm -y &

process_id=$!
echo "PID: $process_id  Instalando npm::::::"
sleep 1
wait $process_id
echo "Exit status: $? : Finalizazo el proceso de Instalacion npm"
versionNpm=$(npm -v)
echo "Version npm $versionNpm"
sleep 2

###Installing nginx
###################
sudo apt-get install nginx -y &

process_id=$!
echo "PID: $process_id  Instalando nginx::::::"
sleep 1
wait $process_id
echo "Exit status: $? : Finalizazo el proceso de Instalacion nginx"
versionNginx=$(nginx -v)
echo "Version Nginx: $versionNginx"
sleep 2


########Configurando server nginx para correr nodejs
####################
if [ ! -f /etc/nginx/sites-available/server-nodejs];
then 
    printf 'No such file\n'

else
    printf 'File exists\n'
    echo "coping file ..... "
    sudo cp /vagrant/server-nodejs /etc/nginx/sites-available/server-nodejs
    sudo rm /etc/nginx/sites-enabled/default
    sudo ln -s /etc/nginx/sites-available/server-nodejs /etc/nginx/sites-enabled
fi

sudo nginx -t
sleep 3
sudo systemctl restart nginx
sudo systemctl reload nginx


###Configurando application layer
####################
sudo cp -R /vagrant/devops-rampup/movie-analyst-ui/ /opt/movie-analyst-ui
cd /opt/movie-analyst-ui
sudo npm install
sudo npm install -g pm2
echo "Instalando npm & pm2"
wait -n

pm2 start server.js


# #sudo apt upgrade -y




