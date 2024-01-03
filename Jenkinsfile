/* Requires the Docker Pipeline plugin */
pipeline {
    agent { docker { image 'trainwithshubham/django-todo:latest' } }
    stages {
        stage('build') {
            steps {
                sh 'docker build -t trainwithshubham/django-todo:latest'
            }
        }
    }
}
