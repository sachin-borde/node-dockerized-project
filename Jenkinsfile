pipeline {
    agent {
        docker {
            image 'docker:24.0.5'
            args  '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Test') {
            steps {
                sh 'npm install'
                sh 'npm test'
            }
        }
        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }
        stage('Build Image') {
            steps {
                sh 'DOCKER_BUILDKIT=1 docker buildx build --tag my-node-app:1.0 --load .'
            }
        }
    }
}
