pipeline {
  agent any

  environment {
    DOCKERHUB_CREDENTIALS = 'dockerhub-creds'
    DOCKERHUB_USERNAME    = 'ssborde26'
    IMAGE_NAME            = "${DOCKERHUB_USERNAME}/node-dockerized-project"
    IMAGE_TAG             = "${env.BUILD_NUMBER}"
    FULL_IMAGE            = "${IMAGE_NAME}:${IMAGE_TAG}"
  }

  stages {
    stage('Checkout') {
      steps { checkout scm }
    }

    stage('Build Docker Image') {
      steps {
        script {
          dockerImage = docker.build(FULL_IMAGE)      // builds image locally :contentReference[oaicite:9]{index=9}
        }
      }
    }

    stage('Push to Docker Hub') {
      steps {
        script {
          // default Docker Hub registry; uses 'dockerhub-creds' for auth :contentReference[oaicite:10]{index=10}
          docker.withRegistry('', "${DOCKERHUB_CREDENTIALS}") {
            dockerImage.push("${IMAGE_TAG}")           // push build-number tag :contentReference[oaicite:11]{index=11}
            dockerImage.push('latest')                 // also tag as 'latest'
          }
        }
      }
    }
  }

  post { always { cleanWs() } }
}
