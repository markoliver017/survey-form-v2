pipeline {
    agent {
        docker {
            image 'node:16.13.1-alpine'
            label 'my-docker-label'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    stages {
        stage('Build') {
            steps {
                dir('/absolute/path/to/working/directory') {
                    sh 'docker build -t my-docker-image .'
                }
            }
        }
        stage('Test') {
            steps {
                dir('/absolute/path/to/working/directory') {
                    sh 'docker run my-docker-image npm test'
                }
            }
        }
    }
}