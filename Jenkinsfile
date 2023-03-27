pipeline {
    agent { dockerfile true }
    stages {
        // stage('Docker login') {
        //     steps {
        //         withCredentials([usernamePassword(credentialsId: "Docker Credentials", usernameVariable: 'mv081623', passwordVariable: 'StyleX@017')]) {
        //             bat "docker login -u $mv081623 -p $StyleX@017"
        //         }
        //     }
        // }
        stage('Docker build and push') {
            steps {
                bat 'docker-compose build'
                bat 'docker-compose push'
            }
        }
        stage('Start application') {
            steps {
                bat 'docker-compose up -d'
            }
        }
        stage('Build') {
            steps {
                dir('/path/to/working/directory') {
                    sh 'npm install'
                }
            }
        }
    }
}