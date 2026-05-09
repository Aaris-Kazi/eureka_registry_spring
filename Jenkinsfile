pipeline {
    agent any

    environment {
        IMAGE_NAME = "aariskazi/eureka-server"
        CONTAINER_NAME = "eureka-server"
        PORT = "8761"
        IMAGE_TAG = "v${BUILD_NUMBER}"
    }

    stages {

        stage('Clean Workspace') {
            steps {
                deleteDir()
            }
        }

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Aaris-Kazi/eureka_registry_spring.git'
            }
        }

        stage('Debug') {
            steps {
                sh 'ls -la'
                sh 'find . -name pom.xml'
            }
        }

        stage('Build JAR') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .
                docker tag ${IMAGE_NAME}:${IMAGE_TAG} ${IMAGE_NAME}:latest
                '''
            }
        }

        stage('Stop Old Container') {
            steps {
                sh 'docker stop $CONTAINER_NAME || true'
                sh 'docker rm $CONTAINER_NAME || true'
            }
        }

        stage('Run Container') {
            steps {
                sh '''
                docker run -d \
                -p $PORT:8761 \
                --name $CONTAINER_NAME \
                $IMAGE_NAME:$IMAGE_TAG
                '''
            }
        }
    }
}