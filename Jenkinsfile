pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                git url: 'https://github.com/Brahmamk3/veera-milestone2.git', branch: 'main'
            }
        }
        stage('build war file'){
            steps{
                sh ' mvn clean package -DskipTests'
            }
        }
        stage('Build image') {
            steps {
                sh 'docker build -t image2 .'
            }
        }
        stage('push to hub'){
            steps{
                withDockerRegistry(credentialsId: 'dockerhub') {
                    sh ' docker tag image2 brahmamk015/demo-repo:springboot2'
                    sh ' docker push brahmamk015/demo-repo:springboot2'
                }
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker run -d --name cont200 -p 8090:8080 image2'
            }
        }
    }
}
