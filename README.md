# MetaboFlowCam Galaxy Docker #

## Description ##

`MetaboFlowCam` docker includes Galaxy metabolomics analysis tools developed
in Jules Group of University of Cambridge:

- [massPix](https://GitHub.com/wanchanglin/massPix): processes high
  resolution mass spectrometry imaging data, performs multivariate
  statistics (PCA, clustering) and lipid identification.

- [dimsp](https://GitHub.com/wanchanglin/dimsp): processes and filter
  Direct-Infusion Mass Spectrometry (DIMS) based lipidomics data.

- [isolab](https://GitHub.com/wanchanglin/isolab): analyses mass
  spectrometric isotopic patterns obtained following isotopic labelling
  experiments.

- [lcms](https://GitHub.com/wanchanglin/lcms): LC-MS data deisotoping and
  annotation for metabolomics analysis.


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

To build `MetaboFlowCam` docker image, do the following steps:

- Launch docker toolbox.
 
  Either click `Docker Quickstart Terminal` icon or run `start.sh` in a
  bash terminal (such as `cygwin`, `msys2` or `git-bash` if you have
  installed)

- Get `Dockerfile` via `git`:

  ```bash
  $ git clone https://github.com/wanchanglin/MetaboFlowCam-docker.git
  ```

- Go the directory to build docker image:
 
  ```bash
  $ cd MetaboFlowCam-docker           ## go to Dockerfile directory
  $ docker build -t cam/metaboflow .  ## build docker image
  $ docker images                     ## check built image
  ```

## Usages ##

There are two modes to run `MetaboFlowCam`. For general user, launch it in
detached/daemon mode:

```bash
$ docker run -d -p 8080:80 cam/metaboflow 
```

You can access `MetaboFlowCam` in web browser (Chrome, Firefox or IE) via
address `192.168.99.100:8080`.

The advanced user can launch in interactive mode:

```bash
$ docker run -it -p 8080:80 cam/metaboflow /bin/bash  ## interactive mode
$ startup                           ## start PostgreSQL, nginx and Galaxy.
```

Go to `192.168.99.100:8080` and run your analysis with `MwtaboFlowCam`.

Some notes for advanced users:

- The initialisation of Galaxy docker takes a considerable time. After the
  first run of Galaxy docker, it is able to avoid the time-consuming Galaxy
  docker initialisation (mainly for installation of tool dependencies). To 
  do so, you can re-use the docker container you has run previously.

  ```bash
  ### list all containers
  $ docker ps -a                 
  ### Restart one stopped containers (not use "docker restart")
  $ docker start -ai container_id_or_name      ## must give -ai
  ```

  here `container_id_or_name` is your `MetaboFlowCam` container ID. The
  re-starting begins from the point you have stopped before. In other words,
  Galaxy docker does not re-install any tool dependencies and all the
  loading data and running results are still there for you references. 

- Docker toolbox is based on Virtual Box. Even you exit docker toolbox, it
  is still running under Virtual Box. To completely exit docker toolbox,
  either stop it in Virtual Box main GUI, or run in a bash terminal:

  ```bash
  $ docker-machine kill default
  ```

  Without this procedure, windows will pop up a message saying something is
  still running when you shut down your computer.

## Authors, contributors & contacts ##

- Wanchang Lin (wl361@cam.ac.uk), University of Cambridge 
- Zoe Hall (zlh22@cam.ac.uk), University of Cambridge 
- Julian L Griffin (jlg40@cam.ac.uk), University of Cambridge 
