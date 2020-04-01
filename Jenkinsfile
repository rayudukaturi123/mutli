pipeline {
    agent any
         stages{
    
    stage ('git clone') {
            steps {
        echo "code is building"
         git 'https://github.com/umahari/testing.git'
            }
        }

        stage ('Bulding docker docker image') {
            steps {
                echo "build docker image"
                sh 'docker build -t httpd .'
            }
        }
        stage ('Uploading to docker hub') {
            steps {
                echo "uploading to docker hub "
                sh 'docker login -u saidevops94 -p Sai@809969'
                sh 'docker tag httpd saidevops94/repos'
                sh 'docker push saidevops94/repos'
            }
        }

        stage ('deploying to GKE') {
           steps {
                echo "deploying imges to GKE"
                sh 'rm -rf /var/lib/jenkins/.kube && aws eks update-kubeconfig --name myeks'
                sh 'kubectl apply -f test-dep.yaml'
                sh 'kubectl apply -f test-svc.yaml'
           }
    }  
        
}

}
