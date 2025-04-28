pipeline {
    agent any
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
                sh 'DOCKER_BUILDKIT=1 docker buildx build -t my-node-app:1.0 .'
            }
        }
    }
}
