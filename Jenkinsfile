pipeline {
    agent any
    environment {
        DOCKER_PATH = "C:\\Program Files\\Docker\\cli-plugins"
        PATH = "${DOCKER_PATH}:${PATH}"
        DOCKERHUB_CREDENTIALS = credentials('DockerHub')
        NODEJS_PATH = "C:\\Program Files (x86)\\nodejs"
    }
    stages {
        stage('Checkout') {
            steps {
                script {
                    checkout scm
                }
            }
        }
        stage('Install Node.js and npm') {
            steps {
                script {
                    def nodejs = tool name: 'NODEJS', type: 'jenkins.plugins.nodejs.tools.NodeJSInstallation'
                    env.PATH = "${nodejs}/bin:${env.PATH}"
                }
            }
        }
        stage('Build Angular Application') {
            steps {
              script {  
                bat 'npm install'  // Installez les dépendances du projet avec "bat"
                bat 'npm run build' // Construisez l'application Angular avec "bat"
            }
        }}
        // stage('Publish Artifact') {
        //     steps {
        //       script{
        //         archiveArtifacts 'dist'  // Archivez les fichiers de l'application construite
        //     }}
        // }
      stage('Publish Artifact') {
    steps {
        script {
            archiveArtifacts artifacts: 'dist/**', allowEmptyArchive: true
        }
    }
}
//       stage('Build & rename Docker Image') {
//     steps {
//         script {
//             // Construisez l'image Docker
//             bat docker build -t "FRONT-ANGULAR-Image:${BUILD_ID}" .
//             bat "docker tag FRONT-ANGULAR-Image:${BUILD_ID} chetouiiftikhar/FRONT-ANGULAR-Image:${BUILD_ID} "
//         }
//     }
// }
      stage('Build & rename Docker Image') {
    steps {
        script {
            // Construisez l'image Docker
            bat "docker build -t front-ang-image:${BUILD_ID} ."
            bat "docker tag front-ang-image:${BUILD_ID} chetouiiftikhar/front-ang-image:${BUILD_ID}"
        }
    }
}



    }
}
