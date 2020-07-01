pipeline {
 agent any
 options {
     buildDiscarder(logRotator(artifactNumToKeepStr: '10'))
 }
 stages {
     stage ('BuildPMMP') {
        steps {
            sh 'chmod +x scripts/build-pmmp.sh'
            sh 'scripts/build-pmmp.sh'
        }
        post {
            success {
                archiveArtifacts artifacts: 'FormAPI.phar', fingerprint: true
            }
        }
     }
 }
 post {
     always {
         deleteDir()
     }
 }
}