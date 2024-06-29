pipeline {
    agent any
    environment {
        ECR_REPO_FRONTEND_URL= '975050320269.dkr.ecr.ap-northeast-1.amazonaws.com/frontend'
        ECR_REPO_BACkEND_URL= '975050320269.dkr.ecr.ap-northeast-1.amazonaws.com/backend'
        AWS_REGION= 'ap-northeast-1'
    }

    stages {
        stage('clone'){
            steps {
                git 'https://gitlab.com/ai-assessments/ai-python-devops-test.git'

            }
            
        }
        // stage('Build') {

        //     steps {
        //         script {
        //             sh 'cd /root/test/frontend/'
        //             docker.build('frontend', 'Dockerfile')
        //             sh 'cd /root/test/backend/'
        //             docker.build('backend', 'Dockerfile')
        //         }
        //     }
        // }

        stage ('docker push') {
            steps {
                script {
                    sh ''' 
                   aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 975050320269.dkr.ecr.ap-northeast-1.amazonaws.com
                    docker tag frontend:latest ${ECR_REPO_FRONTEND_URL}:latest
                    docker push  ${ECR_REPO_FRONTEND_URL}:latest
                    '''

                    sh ''' 
                    aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 975050320269.dkr.ecr.ap-northeast-1.amazonaws.com
                    docker tag backend:latest ${ECR_REPO_BACkEND_URL}:latest
                    docker push  ${ECR_REPO_BACkEND_URL}:latest
                    '''
                }
            }
        }
    }
}