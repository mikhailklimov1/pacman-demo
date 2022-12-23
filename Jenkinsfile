pipeline {
    agent any
    options {
        buildDiscarder(logRotator(numToKeepStr: '5', daysToKeepStr: '5'))
    }
    environment{
//        branch_ = "main"
        REGISTRY_= "https://registry-1.docker.io/"
        REPOSITORY_ = "mikhailklimo1/pacman-demo-test"
        //registryCredential = credentials('dockerhub_creds') - dockerhub credintials "dockerhub_creds" should be added before running the pipeline
        GITHUB_CREDENTIALS = credentials('github_creds')
		DOCKERHUB_CREDENTIALS = credentials('dockerhub_creds')
    }
    stages{
        stage("Git checkout") {
            steps{
                git credentialsId: 'GITHUB_CREDENTIALS', url: 'https://github.com/mikhailklimov1/${REPOSITORY_}', branch: 'main'
	            echo 'Git Checkout Completed'
            }
        }
    }
}
