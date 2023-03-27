pipeline {
    agent any
    environment {
        DOCKER_REGISTRY_CREDENTIALS = credentials('Docker Credentials')
    }
    stages {
        stage('Docker login') {
            steps {
                withCredentials([usernamePassword(credentialsId: "Docker Credentials", usernameVariable: 'mv081623', passwordVariable: 'StyleX@017')]) {
                    bat "docker login -u $mv081623 -p ${env.passwordVariable}"
                }
            }
        }
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
        stage('Run unit tests') {
            steps {
                bat 'npm install'
                bat 'npm test'
            }
        }
    }
}