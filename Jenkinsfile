pipeline{
    agent any
    options{
        buildDiscarder(logRotator(numToKeepStr: '5', daysToKeepStr: '5'))
    }
    environment{
        registry = "https://registry-1.docker.io/"
        repository = "akabarukhin/pacman-demo"
        //registryCredential = credentials('dockerhub-creds') - dockerhub credintials "dockerhub-creds" should be added before running the pipeline
    }
    stages{
      stage('Building image') {
      steps{
        script {
            docker.withRegistry("${registry}", 'dockerhub-creds') {
            def app = docker.build("${repository}")
            app.push("${GIT_BRANCH}-${GIT_COMMIT}")
          }
        }
      }
    }
  }
}
