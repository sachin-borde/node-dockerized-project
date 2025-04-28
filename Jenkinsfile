pipeline {
  agent any

  environment {
    IMAGE_NAME = "YOUR_DOCKERHUB_USERNAME/your-node-repo"
    IMAGE_TAG  = "${env.BUILD_NUMBER}"
  }

  stages {
    stage('Checkout') {
      steps {
        git url: 'https://github.com/sachin-borde/node-dockerized-project.git', branch: 'main'
      }
    }

    stage('Build Docker Image') {
      steps {
        script {
          // Build Docker image from Dockerfile in repo root
          dockerImage = docker.build("${IMAGE_NAME}:${IMAGE_TAG}")
        }
      }
    }

    stage('Push to Docker Hub') {
      steps {
        script {
          // Use credentials 'dockerhub-creds' defined in Jenkins
          docker.withRegistry('', 'dockerhub-creds') {
            dockerImage.push("${IMAGE_TAG}")   // push with build-number tag
            dockerImage.push('latest')         // also tag as 'latest'
          }
        }
      }
    }

    stage('Verify Deployment') {
      steps {
        // Optional: run your image briefly to sanity-check
        sh """
          docker run --rm ${IMAGE_NAME}:${IMAGE_TAG} node --version
        """
      }
    }
  }

  post {
    always {
      cleanWs()  // clean workspace after each run
    }
  }
}
