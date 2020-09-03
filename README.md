[![boods](https://circleci.com/gh/boods/UdacityDevOpsProject.svg?style=svg)](https://app.circleci.com/pipelines/github/boods/UdacityDevOpsProject)


## Project Summary

This is a project submission for the "Operationalize a Machine Learning Microservice API". The project takes a pre-trained sklean model used by a python flask application, to predict house prices in Boston, and walks through four key processes in automating build and deployment of the application to a kubernetes cluster.

Firstly, a Makefile was written that automates the install of the required python libraries, and runs lint of the application and deployment code.

Secondly, a Dockerfile was prepared based on an inherited python3 container, which deploys the python application code to the new container, uses the same commands proven in step one to install python libraries, exposes port 80, and launches the application. The dockerfile can be used locally to build and run the resulting docker image. When successful, the resulting image was uploaded to dockerhub. 

Thirdly, a local kubernetes cluster was setup, and kutectl commands used to create a deployment, based on the image from dockerhub. A bash script was written to automate the deployment and port forwarding process to allow the application to be tested. 

Lastly, a continuous integration project was setup for the application by uploading the project to github, and using CircleCI, a cloud based CI service. 
Markdown to show the build results was added to the github README for the repo. 


## Instructions

### Setup, Install and Linting using Make

1. To setup: `make setup` and `source ~/.devops/bin/activate`
2. To install: `make install`
3. To lint: `make lint`

### Building and running using docker
1. To build and run: `./run_docker.sh`
2. To test, in another terminal window: `./make_prediction.sh`
3. To upload to docker hub: `./upload_docker.sh`

### Deployment to Kuberetes
1. Ensure you have a Kubernetes Minikube installed
2. Start minikube: `minikube start`
3. Download and deploy the docker image: `./run_kubernetes.sh`

Note: There is a simple 5 second sleep in the run_kubernetes.sh bash file, that attempts to let the kubernetes pods spin up before trying to port forward. 
If this is not long enough, it's ok to rerun the script once the pods are running. 

## Files

| File                 | Purpose                                                                                                                   |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| app.py               | The main python flask application                                                                                         | 
| Dockerfile           | Dockerfile to deploy the application, install python requirements, expose port 80 and launch the application              | 
| make_predication.sh  | Bash script for testing the model with a curl POST call to port 8000                                                      |
| Makefile             | Makefile to setup, install python requirements, lint the Dockerfile with hadolint and lint the python script using pylint |
| requirements.txt     | List of python libraries used by the application                                                                          | 
| run_docker.sh        | Bash script to build and launch the docker image                                                                          |
| run_kubernetes.sh    | Bash script to deploy the docker image from dockerhub to a local kubernetes cluster                                       |
| upload_docker.sh     | Bash script to push the built docker image to dockerhub                                                                   |
| .circleci/config.yml | Config file for circleci build service                                                                                    |
| output_txt_files/    | Contains two files `docker_out.txt` and `kubernetes_out.txt` showing the successful output of task 3 and task 6           |



