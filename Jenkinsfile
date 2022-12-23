pipeline{
    agent any
    options{
        buildDiscarder(logRotator(numToKeepStr: '5', daysToKeepStr: '5'))
    }
    environment{
        registry = "https://registry-1.docker.io/"
        repository = "mikhailklimo1/pacman-demo-test"
        //registryCredential = credentials('dockerhub_creds') - dockerhub credintials "dockerhub_creds" should be added before running the pipeline
    }
    stages{
      stage('Building image') {
      steps{
        script {
            docker.withRegistry("${registry}", 'dockerhub_creds') {
            def app = docker.build("${repository}")
            app.push("${GIT_BRANCH}-${GIT_COMMIT}")
          }
        }
      }
    }
  }
}
