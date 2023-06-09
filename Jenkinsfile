pipeline {
  agent any
  
  environment {
    REPOSITORY = "210692783429.dkr.ecr.cn-north-1.amazonaws.com.cn"
    APP_NAME = "sample-vue-app-with-cicd"
  }
  
  stages {
    stage("Prepare Environemnt") {
      steps {
        sh """
          IMAGE_TAG=$(date +%s)
          echo $IMAGE_TAG >image-tag.txt
        """
      }
    }
    stage("Install Dependencies") {
      steps {
        sh "npm ci"
      }
    }

    stage("Check Linting") {
      steps {
        sh "npm run lint"
      }
    }

    stage("Check unit:test") {
      steps {
        sh "npm run test:unit"
      }
    }

    stage("Build") {
      steps {
        sh "docker build -t ${APP_NAME} ."
      }
    }
    stage("Push to Artifatory") {
      steps {
        withCredentials([aws(credentialsId: 'a8445d82-fccd-4240-b775-fc64ac92852a')]) {
          sh "aws s3 ls"
          // sh "./scripts/cicd/push-to-artifactory.sh"
        }
      }
    }
  }
}
