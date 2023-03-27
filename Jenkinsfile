pipeline {
    agent any
    environment {
        DOCKER_REGISTRY_CREDENTIALS = credentials('Docker Credentials')
    }
    stages {
        stage('Docker login') {
            steps {
                withCredentials([usernamePassword(credentialsId: "Docker Credentials", usernameVariable: 'mv081623', passwordVariable: 'StyleX@017')]) {
                    sh "docker login -u $mv081623 -p ${env.passwordVariable}"
                }
            }
        }
        stage('Docker build and push') {
            steps {
                sh 'docker-compose build'
                sh 'docker-compose push'
            }
        }
        stage('Start application') {
            steps {
                sh 'docker-compose up -d'
            }
        }
        stage('Run unit tests') {
            steps {
                sh 'npm install'
                sh 'npm test'
            }
        }
    }
}