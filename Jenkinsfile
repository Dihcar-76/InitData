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
                bat 'mvn clean package -DskipTests'
            }
        }
    }
}