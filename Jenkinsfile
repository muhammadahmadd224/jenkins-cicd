pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'my-nest-app:latest'
        IMAGE_NAME = 'jest_image'
        CONTAINER_NAME = 'nest_container'
        EMAIL = "ym833641@gmail.com"
        PORT = "3000"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/muhammadahmadd224/jenkins-cicd.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Stop and Remove Previous Container') {
            steps {
                sh '''
                    docker stop $CONTAINER_NAME || true
                    docker rm $CONTAINER_NAME || true
                '''
            }
        }

        stage('Run Docker Container') {
            steps {
                sh '''
                    docker run -d -p ${PORT}:${PORT} --name $CONTAINER_NAME $IMAGE_NAME
                '''
            }
        }

        stage('Send Email Notification to our mobile phone') {
            steps {
                emailext(
                    subject: "NestJS application deployed successfully",
                    body: "The Docker container for the NestJS app is running successfully on http://54.209.242.110:${PORT}/",
                    to: "${EMAIL}"
                )
            }
        }
    }
}
