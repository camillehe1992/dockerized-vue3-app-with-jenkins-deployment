pipeline {
  agent any
  stages {
    stage('Install Dependencies') {
      steps {
        sh 'npm ci'
      }
    }

    stage('Check Linting') {
      steps {
        sh 'npm run lint'
      }
    }

    stage('Check unit:test') {
      steps {
        sh 'npm run test:unit'
      }
    }

    stage('Build') {
      steps {
        sh 'docker build -t sample-vue-app-with-cicd .'
      }
    }
    // Comment out this step as we only foucs on build docker image in Jenkins
    // stage('Push to Artifatory') {
    //   steps {
    //     sh 'docker image push --all-tags registry-host:5000/myname/sample-vue-app-with-cicd'
    //   }
    // }
  }
}
