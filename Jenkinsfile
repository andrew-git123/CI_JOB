pipeline {
    agent any

    stages {
        stage ('Compile Stage') {

            steps {
                withMaven(maven : 'apache-maven-3.6.1') {
                    sh 'mvn clean compile'
                }
            }
        }
        stage ('Testing Stage') {

            steps {
                withMaven(maven : 'apache-maven-3.6.1') {
                    sh 'mvn test'
                }
            }
        }
        stage ('Install Stage') {
            steps {
                withMaven(maven : 'apache-maven-3.6.1') {
                    sh 'mvn install'
                }
            }
        }
        stage ('move to S3 bucket') {
            steps {
                withMaven(maven : 'apache-maven-3.6.1') {
                    sh 'aws s3 sync . s3://andrew1212/REST-assured_Cucumber-0.0.1-SNAPSHOT
                }
            }
        }
     }
        post
            {
                always
                        {
                            cleanWs()
                        }
            }
}
