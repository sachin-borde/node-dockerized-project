pipeline {
    agent {
        docker {
            image 'docker:24.0.5-dind'  // Use Docker-in-Docker (DinD) image
            args '--privileged -v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    environment {
        DOCKER_BUILDKIT = '1'  // Enable Docker BuildKit
    }
    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }
        stage('Setup Node.js') {
            steps {
                sh '''
                    apk add --no-cache nodejs npm  # Install Node.js in Alpine
                    node --version
                    npm --version
                '''
            }
        }
        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }
        stage('Run Tests') {
            steps {
                sh 'npm test'
            }
        }
        stage('Build App') {
            steps {
                sh 'npm run build'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh '''
                    docker buildx create --use
                    docker buildx build \
                        --platform linux/amd64 \
                        -t my-node-app:1.0 \
                        --load .
                '''
            }
        }
    }
    post {
        always {
            sh 'docker system prune -f'  // Cleanup Docker artifacts
        }
    }
}
