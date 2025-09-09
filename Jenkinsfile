pipeline{
    agent any
    stages{
        stage('github checkout'){
          steps{
                 git url: 'https://github.com/Brahmamk3/veera-milestone2.git', branch: 'main'
          }
        }
        stage('github checkout'){
          steps{
                 git url: 'https://github.com/Brahmamk3/veera-milestone2.git', branch: 'main'
          }
        }
        stage('Build'){
            steps{
                sh 'docker build -t image1 .'
            }
        }
        stage('deploy'){
            steps{
                sh 'docker run -itd --name cont1 -p 8082:80 image1 .'
            }
        }
    }
}
