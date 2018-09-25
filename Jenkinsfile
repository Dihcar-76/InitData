pipeline {
    agent any
    stages{
        stage('Build') {
            steps{
                bat 'mvn clean package -DskipTests'
            }
        }
        stage('Start couchbase') {
            steps{
                bat 'docker run -d --name db -p 8091-8094:8091-8094 -p 11210-11211:11210-11211 couchbase'
            }
        }
        stage('Run'){
            steps{
                bat 'java app-1.0-SNAPSHOT.jar'
            }
        }
    }
}