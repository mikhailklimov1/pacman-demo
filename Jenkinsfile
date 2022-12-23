pipeline {
    agent any
    options {
        buildDiscarder(logRotator(numToKeepStr: '5', daysToKeepStr: '5'))
    }
    environment {
        BRANCH_ = "main"
        WORKSPACE_ = "/volume/jenkins/workspace/"
        REGISTRY_= "docker.io"
        IMAGE_NAME = "mikhailklimov/pacman-demo-test"
        REPOSITORY_ = "mikhailklimov1/pacman-demo-test"
        //registryCredential = credentials('dockerhub_creds') - dockerhub credintials "dockerhub_creds" should be added before running the pipeline
        GITHUB_CREDENTIALS = credentials('github_creds')
        DOCKERHUB_CREDENTIALS = credentials('dockerhub_creds')
    }
    stages {
        stage("Git checkout") {
            steps {
                ws("${WORKSPACE_}") {
                git credentialsId: 'GITHUB_CREDENTIALS', url: "https://github.com/${REPOSITORY_}", branch: "${BRANCH_}" 
                // Check if it possible to add var instead of specific repo name here ^
                echo 'Git Checkout Completed'
                }
            }
        }
        stage ('Build image') {
            steps {
                ws("${WORKSPACE_}") {    
                    sh 'podman build -t ${IMAGE_NAME}:${GIT_COMMIT} .'
                    echo 'Build Image Completed'
                }			
            }
        }
        stage('Login to Docker Hub') {
            steps {
                ws("${WORKSPACE_}") {
                    sh 'echo ${DOCKERHUB_CREDENTIALS_PSW} | podman login ${REGISTRY_} -u ${DOCKERHUB_CREDENTIALS_USR} --password-stdin'
                    echo 'Login Completed'   
                }
            }           
        }
        stage('Push image to Docker Hub') {
            steps {
                ws("${WORKSPACE_}") {
                    sh 'podman push ${IMAGE_NAME}:${GIT_COMMIT}'
                    echo 'Push Image Completed'
                }
            }
        }
    }
    post {
        always {
            ws("${WORKSPACE_}") {
                sh 'podman rmi ${IMAGE_NAME}:${GIT_COMMIT}'
                sh 'podman logout ${REGISTRY_}'
            }
        }                
    }     
}
