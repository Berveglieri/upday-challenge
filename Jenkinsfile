pipeline {
    agent { label 'docker-agent' }
    stages {
        stage('Deploy') {
            steps {
                sh '''
                    echo "deploying to kubernetes"
                    kustomize build manifests/overlays/production/hello-world/ > hello-world.yaml
                    kubectl apply -f hello-world.yaml 
                '''
      }
    }

  }
}