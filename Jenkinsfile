/* Requires the Docker Pipeline plugin */
pipeline {
    agent { docker { image 'trainwithshubham/django-todo:latest' } }
    stages {
        stage('build') {
            steps {
                sh 'docker run -d -p 8000:8000 trainwithshubham/django-todo:latest'
            }
        }
    }
}
