pipeline {
 agent any
 environment {
 AWS_ACCOUNT_ID="339712822600"
 AWS_DEFAULT_REGION="ap-south-1" 
 IMAGE_REPO_NAME="demo-ecr"
 IMAGE_TAG="latest"
CLUSTER_NAME="reddit-cluster"
SERVICE_NAME="redit-service"
TASK_DEFINITION_NAME="reddit-task"
DESIRED_COUNT="2"
 REPOSITORY_URI = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}"
 }
 
 stages {
 
 stage('Logging into AWS ECR') {
 steps {
 script {
 sh "aws ecr get-login-password --region ${AWS_DEFAULT_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com"
 }
 
 }
 }
 
 // stage('Cloning Git') {
 // steps {
 // checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/sd031/aws_codebuild_codedeploy_nodeJs_demo.git']]]) 
 // }
 // }
 // Building Docker images
 stage('Building image') {
 steps{
 script {
 dockerImage = docker.build "${IMAGE_REPO_NAME}:${IMAGE_TAG}"
 }
 }
 }
 
 // Uploading Docker images into AWS ECR
 stage('Pushing to ECR') {
 steps{ 
 script {
 sh "docker tag ${IMAGE_REPO_NAME}:${IMAGE_TAG} ${REPOSITORY_URI}:$IMAGE_TAG"
 sh "docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:${IMAGE_TAG}"
 }
 }
 }

stage('Ecs Deploy'){
         steps{
                script {
                 sh """chmod +x script.sh"""
			        sh './script.sh'
             }
            }
        }
        
            
	 
          
