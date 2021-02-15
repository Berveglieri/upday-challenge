pipeline {
  agent any
  stages {
    stage('Deploy') {
      steps {
        sh '''
                    echo "deploying to kubernetes"
                    kustomize build overlays/production/hello-world/ > hello-world.yaml
                    kubectl apply -f hello-world.yaml 
                '''
      }
    }

  }
}