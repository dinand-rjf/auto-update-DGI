pipeline {
    agent any
    stages {
        stage('Build Image') {
            steps {
                // Construit l'image Docker à partir du Dockerfile
                sh 'docker build -t site-dgi-prod .'
            }
        }
        stage('Deploy Container') {
            steps {
                // Arrête l'ancien site et lance le nouveau sur le port 8081
                sh 'docker stop dgi-container || true'
                sh 'docker rm dgi-container || true'
                sh 'docker run -d --name dgi-container -p 8081:80 site-dgi-prod'
            }
        }
    }
}