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
        stage ('Versioning & Upload') {
            steps {
                withMaven(maven : 'apache-maven-3.6.1') {
                    sh 'Upload_s3.sh'
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
