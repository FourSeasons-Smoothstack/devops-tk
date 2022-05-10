pipeline{
  agent any
  stages{
    stage('Pull Environment Variables') {
      steps{
        withAWS(credentials:"AWS-TK") {
          sh 'aws s3 cp s3://fs-aline-tk/.env ./env --recursive'
        }
      }
    }
  }
}
