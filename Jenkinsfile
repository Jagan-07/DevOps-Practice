/* Requires the Docker Pipeline plugin */
pipeline {
    agent { label 'docker' }

    environment {
        dockerHome = tool 'myDocker'
        PATH = "${dockerHome}/bin:${env.PATH}"
    }

    stages {
        stage('Initialize') {
            steps {
                script {
                    // Additional initialization steps if needed
                    echo 'Initializing...'
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    echo 'Building the project...'
                    sh 'mvn --version'
                    // Additional build steps if needed
                }
            }
        }

        // Add more stages as needed

    }
}
