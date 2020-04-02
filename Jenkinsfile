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
                sh 'docker build --no-cache -t httpd .'
            }
        }
        stage ('Uploading to docker hub') {
            steps {
                echo "uploading to docker hub"
                sh 'docker login -u saidevops94 -p Sai@809969'
                sh 'docker tag httpd saidevops94/repos:latest'
                sh 'docker push saidevops94/repos:latest'
            }
        }

        stage ('deploying to GKE') {
           steps {
                echo "deploying imges to GKE"
                sh 'docker login -u saidevops94 -p Sai@809969'
                sh 'docker pull saidevops94/repos:latest'
                sh 'kubectl apply -f test-dep.yaml'
                sh 'kubectl apply -f test-svc.yaml'
                sh 'kubectl set image deployment/httpd-deployment httpd2=saidevops94/repos:latest'
           }
    }  
        
}

}
