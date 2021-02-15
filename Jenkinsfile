pipeline {
    agent { label 'docker-agent' }
    stages {
        stage('Deploy') {
            steps {
                withCredentials([file(credentialsId: 'kubeconfig', variable: 'KUBECONFIG')]) {
                    sh 'export KUBECONFIG=$KUBECONFIG'
                    sh './deploy-app.sh'
                    sh '''
                    echo "deploying to kubernetes"
                    export KUBECONFIG=${KUBECONFIG}
                    kustomize build manifests/overlays/production/hello-world/ > hello-world.yaml
                    kubectl apply -f hello-world.yaml 
                '''
                }
            }

        }
    }
}