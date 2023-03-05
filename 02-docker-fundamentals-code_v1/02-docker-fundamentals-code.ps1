## Step-1: Verify Docker version and also login to Docker Hub
docker version
docker login

## Step-2: Pull Image from Docker Hub
docker pull stacksimplify/dockerintro-springboot-helloworld-rest-api:1.0.0-RELEASE

#Run the docker image 
docker run --name app2 -p 80:8080 -d stacksimplify/dockerintro-springboot-helloworld-rest-api:1.0.0-RELEASE

#Check if its running
http://localhost/hello

#Check images
docker images

#Check the RUNNING containers
docker ps

#Check all the containers
docker ps -a

#Check all the containers
docker ps -a -q

#Log into the container shell
docker exec -it app2 /bin/sh

#Output:
# PS C:\Users\shamj\IdeaProjects\azure-aks-kubernetes-masterclass\02-docker-fundamentals-code> docker exec -it app2 /bin/sh
# / # ls
# app.jar  dev      home     media    opt      root     sbin     sys      usr
# bin      etc      lib      mnt      proc     run      srv      tmp      var
# / # ps -ef
# PID   USER     TIME  COMMAND
#     1 root      0:10 java -Djava.security.egd=file:/dev/./urandom -jar /app.jar
#    45 root      0:00 /bin/sh
#    53 root      0:00 ps -ef
# / # exit

#Stop the container (app2)
docker stop app2

#Start the container (app2)
docker start app2

#Remove the container (container needs to be stopped before this command)
docker rm app2

#Remove the docker image (get image id by using "docker images" command)
docker rmi 4a51be64e1ee

## Step-1: Run the base Nginx container
# Access the URL http://localhost

#Get the nginx from docker hub
docker run --name mynginxdefault -p 80:80 -d nginx
docker ps
docker stop mynginxdefault

#CD into "02-docker-fundamentals-code\04-Build-new-Docker-Image-and-Run-and-Push-to-DockerHub\Nginx-DockerFiles"
## Step-3: Build Docker Image & run it
docker build -t shamjeed/mynginx_image1:v1 .
docker run --name mynginx1 -p 80:80 -d shamjeed/mynginx_image1:v1

#Remove all containers
docker rm $(docker ps -a -q)

## Step-4: Tag & push the Docker image to docker hub
docker images
docker tag shamjeed/mynginx_image1:v1 shamjeed/mynginx_image1:v2-release
docker push shamjeed/mynginx_image1:v2-release



