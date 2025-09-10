pipeline {
    agent any
    environment {
        MINIKUBE_SSH_CRED = 'minikube-ssh'
        MINIKUBE_HOST = '18.135.46.78'
        MINIKUBE_USER = 'ubuntu' // Change this if your SSH user is not 'jenkins'
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
                withDockerRegistry(url: 'https://index.docker.io/v1/', credentialsId: 'dockerhub') {
                    sh '''
                        docker tag image2 brahmamk015/demo-repo:springboot5
                        docker push brahmamk015/demo-repo:springboot5
                    '''
                }
            }
        }

        stage('Deploy to Minikube') {
            steps {
                sshagent(credentials: [env.MINIKUBE_SSH_CRED]) {
                    sh """
                        scp -o StrictHostKeyChecking=no deployment-service.yml ${env.MINIKUBE_USER}@${MINIKUBE_HOST}:/tmp/
                        ssh -o StrictHostKeyChecking=no ${env.MINIKUBE_USER}@${MINIKUBE_HOST} '
                            kubectl apply -f /tmp/deployment-service.yml
                            kubectl rollout status deployment/springboot-deployment || true
                        '
                    """
                }
            }
        }
    }
}
