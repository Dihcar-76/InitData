pipeline {
    agent any
    tools {
        maven 'Maven 3.5.4'
        jdk 'jdk8'
    }
    stages{
//        stage ('Initialize') {
//            steps {
//                bat '''
//                    echo "PATH = %PATH%"
//                    echo "M2_HOME = %M2_HOME%"
//                '''
//            }
//        }
        stage('Build') {
            steps{
                bat 'mvn clean package -DskipTests'
            }
        }
        stage('Start couchbase') {
            steps {
                bat 'docker-compose up -d db'
            }
        }

        stage('Init cluster') {
            steps {
                bat 'docker exec db couchbase-cli cluster-init -c 127.0.0.1 --cluster-username Administrator  --cluster-password Administrator --services data, index, query, fts --cluster-ramsize 1024'
            }
        }

        stage('Create bucket') {
            steps{
                bat 'couchbase-cli bucket-create -c 127.0.0.1:8091 --username Administrator --password Administrator --bucket books --bucket-type couchbase --bucket-ramsize 1024 --enable-flush 1'
            }
        }

        stage ('Run Application') {
            steps {
                //bat "DB=`docker inspect --format='{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' db`"
                bat 'docker-compose up -d --build app'
            }
        }
    }
}