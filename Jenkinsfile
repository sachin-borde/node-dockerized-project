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
                sh 'sudo apt install npm'
                sh 'npm test'
            }
        }
        stage('build') {
            steps {
                sh 'npm run build'
            }
        }
    }
}
