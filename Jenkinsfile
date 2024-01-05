pipeline {
    agent any
    stages{
        stage('code'){
            steps{
                git url: 'https://github.com/Jagan-07/ISS-Tracker.git', branch: 'main'
            }
        }
        
        stage('Build'){
            steps{
                sh 'docker build . -t jagan07/iss-tracker:latest'
            }
        }
        stage('Test'){
            steps{
                echo "Testing"
            }
        }
        stage('Deploy'){
            steps{
                sh "docker run -d --name iss-tracker -p 8002:8000 jagan07/iss-tracker:latest"
            }
        }
    }
}
