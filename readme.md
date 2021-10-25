# Spring PetClinic Application Assignment
## List of files created
#### Dockerfile added to specify docker: https://github.com/clementgeorge1223/george-assignment/blob/main/Dockerfile
#### Jenkinsfile added to specify definition for pipeline for this assignment requirement: https://github.com/clementgeorge1223/george-assignment/blob/main/Jenkinsfile 
#### Docker image added to specify definition for pipeline for this assignment requirement: https://github.com/clementgeorge1223/george-assignment/blob/main/docker.vhdx 

## Steps to configure Spring Petclinic Jenkins pipeline
#### Setup Jenkins adding plugins for Pipeline, Docker, Artifactory, Maven
#### On Jenkins slave ensure that the right version of java, docker, maven, is setup
#### create a pipeline in Jenkins using the checked-in Jenkinsfile, setting the trigger on git repository
#### create artifactory repository for the pipeline to publish petclinic build artifacts

## Verification
#### check-in a valid change to pet clinic application. Ensure pipeline successfully pushed the right build artifacts to artifactory
#### check-in a change to the application that fails compilation. Ensure pipeline failed for that reason and NO artifact is published
#### check-in a change to the application that fails a test. Ensure pipeline failed for that reason and NO artifact is published
#### change Jenkins pipeline with incorrect docker or artifactory settings. Ensure pipeline failed for that reason and NO artifact is published

## Run docker image and access application
#### Build image: docker build -t test-petclinic10_24_21 .
#### Save image: docker save -o george_petclinic.tar 4c43ecfff1c4
#### Load image:docker load --input george_petclinic.tar
#### List images: docker images -a
#### Run image: docker run <4c43ecfff1c4>
#### Access application: http://localhost:8080




