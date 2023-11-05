pipline{
     agent any
         def nodejs = tool name: 'NODEJS'
   environment {
       DOCKER_PATH = "C:\\Program Files\\Docker\\cli-plugins"
       NODEJS_PATH = "C:\\Program Files (x86)\\nodejs"
        env.PATH = "${nodejs}/bin:${env.PATH}"
      DOCKERHUB_CREDENTIALS = credentials('DockerHub')
   
   }
       stages {
         stage('checkout'){
            steps {
                script {
                   checkout scm   
                }
            }
      
    }
                stage('installation node package manager'){
            steps {
                script {
                   bat 'ls'  
                }
            }
      
    }
  }
}
