pipeline {
    agent any
    stages {
        stage('checkout') {
            steps {
                checkout scm
            }
        }
        stage('test') {
            steps {
                sh 'npm install'
                sh 'npm test'
            }
        }
        stage('build') {
            steps {
                sh 'npm run build'
            }
        }
        stage('build image') {
            steps {
                sh 'docker build -t my-node-app:1.0 .'
            }
        }
    }
}
