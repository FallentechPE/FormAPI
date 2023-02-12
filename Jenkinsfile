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
         discordSend(customAvatarUrl: "https://i.imgur.com/kEaewDN.png", webhookURL: "https://discord.com/api/webhooks/1072959404028219515/ZD6OmpNjBpZ4CbblyqLHxNU5WJTEYRca16p7JnLIQp5eW7ZwNb3IwI-cyvQeYCy6f0_3", description: "**Build:** ${env.BUILD_NUMBER}\n**Status:** Success\n\n**Changes:**\n${env.BUILD_URL}", footer: "Fallentech Build System", link: "${env.BUILD_URL}", successful: true, title: "Build Success: FormAPI", unstable: false, result: "SUCCESS")
     }
 }
}