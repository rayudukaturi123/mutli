pipeline {
    agent any
         stages{
    
    stage ('git clone') {
            steps {
        echo "code is building"
         git '<url of git>'
            }
        }

        stage ('Bulding docker docker image') {
            steps {
                echo "build docker image"
                sh 'docker build -t test:1 .'
            }
        }
        stage ('Uploading to Ecr') {
            steps {
                echo "uploading to ECR "
                sh 'aws ecr get-login --no-include-email'
                sh 'docker tag mytestrepo:1 642975937704.dkr.ecr.ap-northeast-1.amazonaws.com/mytestrepo:1'
        sh 'docker push 642975937704.dkr.ecr.ap-northeast-1.amazonaws.com/mytestrepo:1'
            }
        }

        stage ('deploying to EKS') {
           steps {
                echo "deploying imges to EKS"
                sh 'rm -rf /var/lib/jenkins/.kube && aws eks update-kubeconfig --name myeks'
                sh 'kubectl apply -f test-dep.yaml'
                sh 'kubectl apply -f test-svc.yaml'
           }
    }  
        
}

}
