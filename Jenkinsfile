pipeline {
    agent any
    tools {
        maven 'Maven 3.5.4'
        jdk 'jdk8'
    }
    stages{
        stage ('Initialize') {
            steps {
                bat '''
                    echo "PATH = %PATH%"
                    echo "M2_HOME = %M2_HOME%"
                '''
            }
        }
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
                bat 'java -jar target/app-1.0-SNAPSHOT.jar -classpath org.ci.Main'
            }
        }
    }
}