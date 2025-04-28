jenkinsfile {
    agent any
    stages {
        stage("checkout){
            steps {
                checkout scm
            }
        }
        stage("test"){
            steps {
                sh 'sudo npm install'
                sh 'npm test'
            }
        }
        stage("build"){
            steps {
                sh 'npm run build'
            }
        }
    }
}
