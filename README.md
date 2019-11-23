[![CircleCI](https://circleci.com/gh/pivarnikjan/machine-learning-ms.svg?style=svg)](https://circleci.com/gh/pivarnikjan/machine-learning-ms)
# Machine Learning Microservice API

## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API.

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

---

### Tracking progress: <br>
[X] All files are submitted. <br>
[X] .circleci folder is included. <br>
[X] Extend app.py to log a prediction value. <br>
[X] The project shows the proper use of documentation. <br>
[X] The project passes linting via a Makefile. <br>
[X] Dockerfile is complete. <br>
[X] Dockerfile passes linting via a Makefile. <br>
[X] Log output is saved in docker_out.txt. <br>
[X] run_docker.sh is complete. <br>
[X] Docker image is uploaded to docker via upload_docker.sh. <br>
[X] run_kubernetes.sh is complete. <br>
[X] An output prediction is saved in kubernetes_out.txt. <br>

---

## Setup the Environment

### Prerequisites

#### Docker installation:

- Remove old Docker
    ```bash
    sudo apt-get remove docker docker-engine docker.io containerd runc
    ```
- Update the apt package index:
    ```bash
    sudo apt-get update
    ```
- Install packages to allow apt to use a repository over HTTPS:
    ```bash
    sudo apt-get install \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common
    ```
- Add Docker’s official GPG key:
    ```bash
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    ```
- Use the following command to set up the stable repository.
    ```bash
    sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
    ```
- Update the apt package index.
    ```bash
    sudo apt-get update
    ```
- Install the latest version of Docker
    ```bash
    sudo apt-get -y  install docker-ce docker-compose
    ```
- Add your normal user to the group to run docker commands as non-privileged user.
    ```bash
    sudo usermod -aG docker $USER
    ```

#### Minikube installation:
- Download and install minikube to /usr/local/bin:
    ``` bash
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
       && sudo install minikube-linux-amd64 /usr/local/bin/minikube
    ```
- Start minikube within VirtualBox
    ```
    sudo minikube start --vm-driver=none
    ```
- Make none the default driver:
    ```
    sudo minikube config set vm-driver none
    ```

#### Kubectl installation
- Download the latest release with the command:
    ```bash
    curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

    ```
- Make the kubectl binary executable.
    ```bash
    chmod +x ./kubectl
    ```
- Move the binary in to your PATH.
    ```bash
    sudo mv ./kubectl /usr/local/bin/kubectl
    ```
- Test to ensure the version you installed is up-to-date:
    ```bash
    kubectl version
    ```

#### socat: Linux / UNIX TCP Port Forwarder
- Install socat Under Debian / Ubuntu Linux:
    ```bash
    sudo apt-get update && sudo apt-get install socat

    ```

#### Virtualenvwrapper
- Install via pip repository
    ```bash
    pip install virtualenvwrapper
    ```
- Export env directory
    ```bash
    export WORKON_HOME=~/Envs
    ```
- Create env directory
    ```bash
    mkdir -p $WORKON_HOME
    ```
- Activate wrapper
    ```bash
    source /usr/local/bin/virtualenvwrapper.sh
    ```
- Create a virtualenv and activate it
    ```bash
    mkvirtualenv machine-learning-ms -p /usr/local/bin/python3.7
    ```

Run `make install` to install the necessary dependencies

### Linting
- add W1202 to pylint Ignore for f-strings

Run `make lint` to lint dockerfile and app.py
Run `upload_docker.sh` for pushing your docker image to docker hub

### Running `app.py`

1. Standalone:  `python3 app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`