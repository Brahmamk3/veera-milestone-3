pipeline {
    agent any

    environment {
        // Path where kubeconfig is placed for Jenkins
        KUBECONFIG = "/var/lib/jenkins/.kube/config"
    }

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

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t image2 .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withDockerRegistry(credentialsId: 'dockerhub') {
                    sh '''
                        docker tag image2 brahmamk015/demo-repo:springboot2
                        docker push brahmamk015/demo-repo:springboot2
                    '''
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh '''
                    echo "Using kubeconfig: $KUBECONFIG"
                    kubectl apply -f deployment-service.yml
                    kubectl rollout status deployment/springboot-deployment
                '''
            }
        }
    }
}
