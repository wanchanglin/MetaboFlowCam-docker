# MetaboFlowCam Docker#

## Description ##

## Installation for Windows ##

To run Docker under Windows, your machine must have a 64-bit operating
system running Windows 7 or higher. Additionally, you must make sure that
virtualisation is enabled on your machine.

### Docker toolbox ###

Docker toolbox can be installed for Windows 7 or higher. It requires Oracle
[VM VirtualBox](https://www.virtualbox.org/wiki/Downloads) and Git MSYS-git
UNIX tools. Download the [latest
release](https://github.com/docker/toolbox/releases) and follow the
[installation
procedure](https://docs.docker.com/toolbox/toolbox_install_windows/).

### Docker image ###

To build MetaboFlowCam Docker image, do the following steps:

- Launch Docker toolbox. Either click `Docker Quickstart Terminal` icon or
  run `start.sh` in a bash terminal (such as `cygwin`, `msys2` or `git-bash`
  if you have installed)

- Use `git clone` to get `Dockerfile`:

  ```
  git clone https://github.com/wanchanglin/MetaboFlowCam-docker.git
  ```

- Go the directory and run:
 
  ```bash
  $ cd MetaboFlowCam-docker
  $ docker build -t cam/metaboflow .
  $ docker images                     ## check built image
  ```

## Usages ##

There are two modes to run `MetaboFlowCam`. For general users, launch it in
Detached/Daemon mode:

```
$ docker run -d -p 8080:80 cam/metaboflow 
```

In your open web browser (Chrome, Firefox or IE), access address
`192.168.99.100:8080` and you should find that `MetaboFlowCam` is running.

The advanced users can run it in interactive mode:

```
$ docker run -it -p 8080:80 bcam/metaboflow /bin/bash
$ startup                           ## start PostgreSQL, nginx and Galaxy.
```

Go to `192.168.99.100:8080` and run your analysis with `MwtaboFlowCam`.

Some notes for advanced users:

- The initialisation of Galaxy docker takes a considerable time. After the
  first run of Galaxy docker, it is able to avoid the time-consuming Galaxy
  docker initialisation (mainly for installation of tool dependencies). To 
  do so, you can re-use the docker container you has run previously.

  ```
  ### list all containers
  $ docker ps -a                 
  ### Restart one stopped containers (not use "docker restart")
  $ docker start -ai container_id_or_name      ## must give -ai
  ```

  here `container_id_or_name` is your `MetaboFlowCam` container. The
  re-starting begins from the point you have stopped before. In other words,
  Galaxy docker does not re-install any dependencies of tools and all the
  loading data and running results are still there for you references. 

- Docker toolbox is based on Virtual Box. Even you exit docker toolbox, it
  is still running under Virtual Box. To completely exit docker toolbox,
  either stop it in Virtual Box main GUI, or run in bash terminal:

  ```bash
  $ docker-machine kill default
  ```

  Without this procedure, windows will pop up a message saying something is
  still running when you shut down your computer.

