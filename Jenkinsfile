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
                sh 'docker build -t httpd:1 .'
            }
        }
        stage ('Uploading to docker hub') {
            steps {
                echo "uploading to docker hub "
                sh 'dokcer login -u saidevops94 -p Sai@809969'
                sh 'docker push tag httpd saidevops94/repos' 
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
