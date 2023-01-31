pipeline{
    agent any
    environment {
       AWS_ACCOUNT_ID="161251504746"
       AWS_DEFAULT_REGION="ap-south-1"
       IMAGE_REPO_NAME="webapp"
       IMAGE_TAG="latest"
       REPOSITORY_URI = "161251504746.dkr.ecr.ap-south-1.amazonaws.com/${webapp}"
    }
    stages{
        stage("Logging into AWS ECR") {
            steps {
                script {
                     withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'pwd', usernameVariable: 'user')]) {
                    // sh "docker login -u ${user} -p ${pwd}"
                    //sh "docker push pgreeshma/welpython:v1"
                    //sh “aws ecr get-login-password — region ${AWS_DEFAULT_REGION}  docker login — username ${user} — password ${pwd} ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com”
                     sh "aws ecr get-login-password — region ${AWS_DEFAULT_REGION} | docker login — username AWS — password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com"
                     }
                }
            }
        }
        stage("docker build"){
            steps{
                script{
                         dockerImage = docker.build "${IMAGE_REPO_NAME}:${IMAGE_TAG}"
                         //sh docker build -t webapp .
                }
            }
        }
        stage ("dockerpush"){
            steps{
                script {
                    sh "docker tag ${IMAGE_REPO_NAME}:${IMAGE_TAG} ${REPOSITORY_URI}:$IMAGE_TAG"
                    sh "docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:${IMAGE_TAG}"
                }
            }
        }
    }
}

