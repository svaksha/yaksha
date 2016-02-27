



# Function to start docker
sudo service docker start


# Function to change ulimit in docker
# http://stackoverflow.com/questions/24318543/how-to-set-ulimit-file-descriptor-on-docker-container-the-image-tag-is-phusion
sudo bash -c "echo \"limit nofile 262144 262144\" >> /etc/init/docker.conf"


# Function to stop docker
sudo service docker stop

