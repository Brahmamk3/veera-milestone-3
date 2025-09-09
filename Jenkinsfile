pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                git url: 'https://github.com/Brahmamk3/veera-milestone2.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                sh 'docker build -t image1 .'
            }
        }
        stage('push to hub'){
            steps{
                withDockerRegistry(credentialsId: 'dockerhub') {
                    sh ' docker tag image1 brahmamk015/demo-repo:indexHTML1'
                    sh ' docker push brahmamk015/demo-repo:indexHTML1'
                }
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker run -d --name cont10 -p 8086:80 image1'
            }
        }
    }
}
