pipeline {
    agent any
       triggers {
        pollSCM "* * * * *"
       }
    stages {
        stage('Compile the code') { 
            steps {
                echo '=== Get code from Git ==='
		git 'https://github.com/spring-projects/spring-petclinic.git'

		echo '=== Build ==='
                sh 'mvn -B -DskipTests clean package' 

		echo '=== generate resources, check dependencies==='
		sh './mvnw generate-resources'
            }
        }
        stage('Run the tests') {
            steps {
                echo '=== Run builtin tests'
                sh 'mvnw test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }

        stage('Artifactory Configuration') {
            steps {
                rtServer (
                    id: "george-artifactory",
                    url: "https://george.com/artifactory",
                    credentialsId: "admin.george"
                )
 
                rtMavenResolver (
                    id: 'maven-resolver',
                    serverId: 'george-artifactory',
                    releaseRepo: 'libs-release',
                    snapshotRepo: 'libs-snapshot'
                )  
                 
                rtMavenDeployer (
                    id: 'maven-deployer',
                    serverId: george-artifactory,
                    releaseRepo: 'libs-release-local',
                    snapshotRepo: 'libs-snapshot-local',
                    threads: 6,
                    properties: ['BinaryPurpose=Technical-Assignment', 'Team=Solution-Architecture']
                )
            }
        }
        
        stage('Build Maven Project') {
            steps {
                rtMavenRun (
                    tool: 'Maven 3.8.3',
                    pom: 'pom.xml',
                    goals: '-U clean install',
                    deployerId: "maven-deployer",
                    resolverId: "maven-resolver"
                )
            }
        }
 
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("george-docker.jfrog.io/" + "pet-clinic:1.0.${env.BUILD_NUMBER}")
                }
            }
        }
 
        stage('Push Image to Artifactory') {
            steps {
                rtDockerPush(
                    serverId: "george-artifactory",
                    image: "george-docker.com/" + "pet-clinic:1.0.${env.BUILD_NUMBER}",
                    targetRepo: 'docker',
                    properties: 'project-name=jfrog-assignment-post;status=stable'
                )
            }
        }

    }
}