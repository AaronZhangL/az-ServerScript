#-------------------------------------------------------------------------------
# Docker command
#-------------------------------------------------------------------------------

### Listing images on the host
docker images
#= REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
#= ubuntu              14.04               1d073211c498        3 days ago          187.9 MB
#= busybox             latest              2c5ac3f849df        5 days ago          1.113 MB
#= training/webapp     latest              54bb4e8718e8 

# You can see the images you’ve previously used in the user guide. Each has been downloaded from Docker Hub when you launched a container using that image. When you list images, you get three crucial pieces of information in the listing.

# What repository they came from, for example ubuntu.
# The tags for each image, for example 14.04.
# The image ID of each image.
# Tip: You can use a third-party dockviz tool or the Image layers site to display
# visualizations of image data.

# A repository potentially holds multiple variants of an image. In the case of our ubuntu image you can see multiple variants covering Ubuntu 10.04, 12.04, 12.10, 13.04, 13.10 and 14.04. Each variant is identified by a tag and you can refer to a tagged image like so:

#= ubuntu:14.04

# So when you run a container you refer to a tagged image like so:
docker run -t -i ubuntu:14.04 /bin/bash

#If instead you wanted to run an Ubuntu 12.04 image you’d use:
docker run -t -i ubuntu:12.04 /bin/bash
#If you don’t specify a variant, for example you just use ubuntu, then Docker will default to using the ubuntu:latest image.

#Tip: You should always specify an image tag, for example ubuntu:14.04. That way, you always know exactly what variant of an image you are using. This is useful for troubleshooting and debugging.

### Getting a new image
# So how do you get new images? Well Docker will automatically download any image you use that isn’t already present on the Docker host. But this can potentially add some time to the launch of a container. If you want to pre-load an image you can download it using the docker pull command. Suppose you’d like to download the centos image.

docker pull centos
#- Pulling repository centos
#- b7de3133ff98: Pulling dependent layers
#- 5cc9e91966f7: Pulling fs layer
#- 511136ea3c5a: Download complete
#- ef52fb1fe610: Download complete
#- . . .

#- Status: Downloaded newer image for centos

# You can see that each layer of the image has been pulled down and now you can run a container from this image and you won’t have to wait to download the image.

docker run -t -i centos /bin/bash
#= bash-4.1#

#Finding images
# One of the features of Docker is that a lot of people have created Docker images for a variety of purposes. Many of these have been uploaded to Docker Hub. You can search these images on the Docker Hub website.

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
docker
#= Usage: docker [OPTIONS] COMMAND [arg...]
#=        docker daemon [ --help | ... ]
#=        docker [ --help | -v | --version ]

#= A self-sufficient runtime for containers.

#= Options:

#=   --config=~/.docker              Location of client config files
#=   -D, --debug                     Enable debug mode
#=   -H, --host=[]                   Daemon socket(s) to connect to
#=   -h, --help                      Print usage
#=   -l, --log-level=info            Set the logging level
#=   --tls                           Use TLS; implied by --tlsverify
#=   --tlscacert=~/.docker/ca.pem    Trust certs signed only by this CA
#=   --tlscert=~/.docker/cert.pem    Path to TLS certificate file
#=   --tlskey=~/.docker/key.pem      Path to TLS key file
#=   --tlsverify                     Use TLS and verify the remote
#=   -v, --version                   Print version information and quit

#= Commands:
#=     attach    Attach to a running container
#=     build     Build an image from a Dockerfile
#=     commit    Create a new image from a container's changes
#=     cp        Copy files/folders between a container and the local filesystem
#=     create    Create a new container
#=     diff      Inspect changes on a container's filesystem
#=     events    Get real time events from the server
#=     exec      Run a command in a running container
#=     export    Export a container's filesystem as a tar archive
#=     history   Show the history of an image
#=     images    List images
#=     import    Import the contents from a tarball to create a filesystem image
#=     info      Display system-wide information
#=     inspect   Return low-level information on a container or image
#=     kill      Kill a running container
#=     load      Load an image from a tar archive or STDIN
#=     login     Register or log in to a Docker registry
#=     logout    Log out from a Docker registry
#=     logs      Fetch the logs of a container
#=    network   Manage Docker networks
#=     pause     Pause all processes within a container
#=     port      List port mappings or a specific mapping for the CONTAINER
#=     ps        List containers
#=     pull      Pull an image or a repository from a registry
#=     push      Push an image or a repository to a registry
#=     rename    Rename a container
#=     restart   Restart a container
#=     rm        Remove one or more containers
#=     rmi       Remove one or more images
#=     run       Run a command in a new container
#=     save      Save an image(s) to a tar archive
#=     search    Search the Docker Hub for images
#=     start     Start one or more stopped containers
#=     stats     Display a live stream of container(s) resource usage statistics
#=     stop      Stop a running container
#=     tag       Tag an image into a repository
#=     top       Display the running processes of a container
#=     unpause   Unpause all processes within a container
#=     update    Update resources of one or more containers
#=     version   Show the Docker version information
#=     volume    Manage Docker volumes
#=     wait      Block until a container stops, then print its exit code

#= Run 'docker COMMAND --help' for more information on a command.

# Pull centos official version
docker search centos
docker pull centos

# This command only pulls the image tagged centos:latest, which always points to the latest stable CentOS release, currently CentOS 7 (centos:centos7). To pull any other version of the CentOS image, for example CentOS 6:
sudo docker pull centos:centos6

sudo docker images centos
#= REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
#= centos              centos6             a30bc9f3097e        3 days ago          215.8 MB
#= centos              latest              dade6cb4530a        3 days ago          224 MB
#= centos              centos7             dade6cb4530a        3 days ago          224 MB 

# List locate images
docker images

### Create container from official centos verson
sudo docker run -t -i centos /bin/bash
#= root@0b2616b0e5a8:/#

# Running a basic cat command using docker:
sudo docker run centos:latest cat /etc/centos-release
#= CentOS Linux release 7.0.1406 (Core)

#-------------------------------------------------------------------------------
# See: http://developerblog.redhat.com/2014/05/15/practical-introduction-to-docker-containers/
#-------------------------------------------------------------------------------

### Commit the container
docker ps -a
#= CONTAINER ID        IMAGE               COMMAND                  CREATED              STATUS                     PORTS               NAMES
#= c65fe9f4194b        centos              "bash"                   About a minute ago   Exited (0) 3 seconds ago                       condescending_galileo
#= 620e24fc14c2        centos-updated      "tail /var/log/yum.lo"   6 minutes ago        Exited (0) 6 minutes ago                       determined_perlman
#= ...

# Now, commit the container back as a branch of it’s base image
docker commit c65fe9f4194b

### Push a Container
docker tag centos-test fatherlinux/centos-test
docker push fatherlinux/centos-test
#= The push refers to a repository [fatherlinux/centos-test] (len: 1)
#= Sending image list
#= Pushing repository fatherlinux/centos-test (1 tags)
#= e39724bc32b2: Image already pushed, skipping 
#= c9bfb69481a8: Image successfully pushed 
#= Pushing tag for rev [c9bfb69481a8] on {https://registry-1.docker.io/v1/repositories/fatherlinux/centos6-base-hostname/tags/latest}

### Create Base Image
# Create a tar file of the system
tar --numeric-owner --exclude=/proc --exclude=/sys -cvf centos6-base.tar /

# Copy the tar file to where the consuming system and Import the image
cat centos6-base.tar | docker import - centos6-base

# Test
docker run -i -t centos6-base cat /etc/redhat-release

# Set Up a Registry Server
# Notice that the entire application is packaged up and ran from inside of a docker container. This has the interesting consequence that we are not even concerned with what operating system is hosting this registry application. Also, notice that port 5000 in the docker container is mapped to port 5000 on the hosting virtual machine, which makes the application running in the container transparently appear to be running on the virtual machine.
docker run -p 5000:5000 registry

# Start docker container. SAMPLE-> localhost port:8080, container port: 3000
docker run -p 8080:3000 -d az:cnvet

# Search Private Registry
# List all images in the repository
http://registry.example.com:5000/v1/search?

#Search for all repositories with the word “rhel” in their name
http://registry.example.com:5000/v1/search?q=rhel




