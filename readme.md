# Spring PetClinic Application Assignment
## List of files created
#### Dockerfile added to specify docker: https://github.com/spring-projects/spring-petclinic/Dockerfile
#### Jenkinsfile added to specify definition for pipeline for this assignment requirement: https://github.com/spring-projects/spring-petclinic/Jenkinsfile 
#### Docker image added to specify definition for pipeline for this assignment requirement: https://github.com/spring-projects/spring-petclinic/Jdocker.vhdx 

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



