pipeline {
    agent any
    environment {
        DOCKER_PATH = "C:\\Program Files\\Docker\\cli-plugins"
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
                dir('pipline-FRONT-ANG-test1') 
                {
                bat 'npm install'  // Installez les dépendances du projet avec "bat"
                bat 'npm run build' // Construisez l'application Angular avec "bat"
            }}
        }
        stage('Publish Artifact') {
            steps {
                archiveArtifacts 'dist/*'  // Archivez les fichiers de l'application construite
            }
        }
    }
}}
