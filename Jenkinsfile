pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                git url: 'https://github.com/Brahmamk3/veera-milestone2.git', branch: 'main'
            }
        }

        stage('Build WAR file') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker image') {
            steps {
                sh 'docker build -t image2 .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withDockerRegistry(credentialsId: 'dockerhub') {
                    sh 'docker tag image2 brahmamk015/demo-repo:springboot3'
                    sh 'docker push brahmamk015/demo-repo:springboot3'
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh '''
                    kubectl apply -f deployment-service.yml
                    kubectl rollout status deployment/springboot-deployment
                '''
            }
        }
    }
}
