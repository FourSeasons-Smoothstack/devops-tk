pipeline{
  agent any
  stages{
    stage('Pull Environment Variables') {
      steps{
        withAWS(credentials:"AWS-TK") {
          sh 's3://fs-aline-tk/aline-env-tk/ ./aline-env-tk --recursive'
        }
      }
    }

    stage('Docker Compose Up') {
      steps {
        script {
          withCredentials([string(credentialsId: 'AWS-ID', variable: 'ID')]) {
            withAWS(credentials: 'AWS-TK', region: 'us-west-1') {
              sh "aws ecr get-login-password --region us-west-1 | docker login --username AWS --password-stdin " + ID + ".dkr.ecr.us-west-1.amazonaws.com"
              sh "docker context use ecs-tk"
              sh "docker compose up"
            }
          }
        }
      }
    }
  }
  post{
    always{
      withAWS(credentials: 'AWS-TK', region: 'us-west-1') {
        sh 'docker context use default'
      }
    }
  }
}
