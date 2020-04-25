#!/bin/bash
# docknet: run dotnet commands in a docker container.
# The current directory is mounted as the container's working directory
# to allow runing dotnet commands as of it was installed locally.

# assign mount directory the same name as current directory
mntDir="/usrProj/$(basename $PWD)"

# run dotnet command with all args
# must be run as root on the container so ensure any files
#+created are owned by the calling user:group
command="dotnet $@ && chown -R $(id -u ${USER}):$(id -g ${USER}) ./"

# image for the container. Change to change sdk version
image='mcr.microsoft.com/dotnet/core/sdk:3.1'

docker run -it\
 --rm\
 -v ${PWD}:${mntDir}\
 -w ${mntDir}\
 ${image}\
 /bin/bash -c "${command}"

