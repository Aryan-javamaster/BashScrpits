#!/bin/bash

echo "do you want to install docker(y/n)"

read result

#docker install


docker_install () {
	echo "updating repo's"
	sleep 2
	sudo chmod a+r /etc/apt/keyrings/docker.gpg
	sudo apt update
	echo "done"
	echo "installing required dependency"
	sleep 2
	sudo apt install ca-certificates curl gnupg lsb-release -y
	echo "done"
	echo "getting offical gpg key"
	sleep 2
	sudo mkdir -m 0755 -p /etc/apt/keyrings
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
	echo "done"
	echo "setting up repo's"
	sleep 2
	echo \
	"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  	$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	echo "finally installing Docker and Docker-compose"
	sudo chmod a+r /etc/apt/keyrings/docker.gpg
	sudo apt-get update
	sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
	echo "done.."
	echo "testing"
	sudo docker run hello-world
	echo "Done docker is now installed thanks for using this script -- ARYAN SINGH"
}

portainer_install () {
	sudo docker volume create portainer_data
	sudo docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
}

if [[ $result == "y" ]]; then
	echo "Downloading......docker"
	docker_install
	echo "do you want to install poratiner: Portianer is a GUI to manage all your conatiner (y/n)"
	read portainer
	if [[ $portainer == "y" ]]; then 
		portainer_install
		ip=$(hostname -I)
		echo "portainer is now installed and running you can access the GUI at https://$ip:9443"
		echo "thank you again :)"
	else 
		exit
	fi
else 
	exit
fi 



