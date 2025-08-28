pipeline{
    agent any
    tools{
        maven 'maven'
    }
    stages{
        stage('github checkout'){
          steps{
                 git url: 'https://github.com/Brahmamk3/veera-milestone2.git', branch: 'main'
          }
        }
        stage('test and compilt and build with maven'){
          steps{
                 sh 'mvn clean package -DskipTests'
          }
        }
        stage('Install tomcat'){
            steps{
                withCredentials([sshUserPrivateKey(credentialsId: 'ramssh' ,
                                                   keyFileVariable: 'SSH_KEY',
                                                   usernameVariable: 'SSH_USER')]){
                    sh '''
                        ANSIBLE_HOST_KEY_CHECKING=False\
                        ansible-playbook -i "35.179.120.115", -u $SSH_USER --private-key $SSH_key ansible/tomcat-install.yml
                        '''
                    
                }
            }
        }
        stage('deploy tomcat'){
            steps{
                withCredentials([sshUserPrivateKey(credentialsId: 'ramssh' ,
                                                   keyFileVariable: 'SSH_KEY',
                                                   usernameVariable: 'SSH_USER')]){
                    sh '''
                        ANSIBLE_HOST_KEY_CHECKING=False\
                        ansible-playbook -i  "35.179.120.115", -u $SSH_USER --private-key $SSH_key\
                        ansible/deploy.yml --extra-vars "war_file=${WORKSPACE}/target/addressbook.war app_name=addressbook"
                        '''
                    
                }
            }
        }
    }
}
