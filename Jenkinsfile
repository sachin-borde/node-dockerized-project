pipeline {
  agent any

  environment {
    // Must be all lowercase to satisfy Docker naming rules:
    DOCKERHUB_CREDENTIALS = 'dockerhub-creds'
    DOCKERHUB_USERNAME    = 'ssborde26'
    IMAGE_NAME            = "${DOCKERHUB_USERNAME}/node-dockerized-project"
    IMAGE_TAG             = "${env.BUILD_NUMBER}"
    FULL_IMAGE            = "${IMAGE_NAME}:${IMAGE_TAG}"
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build Docker Image') {
      steps {
        script {
          // Builds the Dockerfile in the repo, returns an image object :contentReference[oaicite:6]{index=6}
          dockerImage = docker.build(FULL_IMAGE)
        }
      }
    }

    stage('Push to Docker Hub') {
      steps {
        script {
          // Logs in using 'dockerhub-creds' and pushes both tags :contentReference[oaicite:7]{index=7}
          docker.withRegistry('https://registry.hub.docker.com', "${DOCKERHUB_CREDENTIALS}") {
            dockerImage.push("${IMAGE_TAG}")
            dockerImage.push('latest')
          }
        }
      }
    }

    stage('Verify Image') {
      steps {
        // Quick check that the image runs and responds to `node --version` :contentReference[oaicite:8]{index=8}
        sh "docker run --rm ${FULL_IMAGE} node --version"
      }
    }
  }

  post {
    always {
      cleanWs()
    }
  }
}
