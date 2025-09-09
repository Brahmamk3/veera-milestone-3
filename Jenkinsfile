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

        stage('Deploy') {
            steps {
                sh 'docker run -d --name cont1 -p 8082:80 image1'
            }
        }
    }
}
