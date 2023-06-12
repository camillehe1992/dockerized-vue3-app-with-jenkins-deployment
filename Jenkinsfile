pipeline {
  agent any

  environment {
    REPOSITORY = "xxxxxxxxxx.dkr.ecr.{region}.amazonaws.com"
    APP_NAME = "sample-vue-app-with-cicd"
  }
  
  stages {
    stage("Prepare Environemnt") {
      steps {
        script {
          def timestamps = sh(script: "date +%s", returnStatus: true)
          echo "${timestamps}"
          def image_tag = "${timestamps}.${env.BUILD_NUMBER}"
          echo "image_tag: ${image_tag}"
          writeFile(file: 'image-tag.txt', text: image_tag)
        }
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
        sh "docker build -t ${env.APP_NAME} ."
      }
    }
    // stage("Push to Artifatory") {
    //   steps {
    //     withCredentials([aws(credentialsId: 'CREDENTIALS_ID')]) {
    //       script {
    //         def image_tag = readFile(file: 'image-tag.txt')
    //         // Retrieve an authentication token and authenticate your Docker client to your registry
    //         aws ecr get-login-password --region cn-north-1 | docker login --username AWS --password-stdin "${env.REPOSITORY}"

    //         // Tag your image so you can push the image to this repository
    //         docker tag "${APP_NAME}:${image_tag}" "${REPOSITORY}/${APP_NAME}:${image_tag}"
    //         docker tag "${APP_NAME}:${image_tag}" "${REPOSITORY}/${APP_NAME}:latest"

    //         // Push image
    //         docker image push --all-tags "${REPOSITORY}/${APP_NAME}"

    //         docker push "${env.REPOSITORY}/${env.APP_NAME}:latest"
    //       }
    //     }
    //   }
    // }
  }
}
