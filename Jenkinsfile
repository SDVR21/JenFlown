pipeline {
    agent any
    environment {
        PROJECT_ID = 'flown-407116'
        CLUSTER_NAME = 'flown-k8s-2'
        LOCATION = 'asia-northeast3-a'
        CREDENTIALS_ID = 'GKE'
    }
    stages {
        stage("Checkout code") {
            steps {
                checkout scm
            }
        }
        stage("Build image") {
            steps {
                script {
                    myapp = docker.build("sdvr/flown-test:${env.BUILD_ID}")
                }
            }
        }
        stage("Push image") {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                            myapp.push("latest")
                            myapp.push("${env.BUILD_ID}")
                    }
                }
            }
        }        
        stage('Deploy to GKE') {
			when {
				branch 'main'
			}
            steps{
                sh "sed -i 's/flown-test:latest/flown-test:${env.BUILD_ID}/g' server-deploy.yaml"
                step([$class: 'KubernetesEngineBuilder', projectId: env.PROJECT_ID, clusterName: env.CLUSTER_NAME, location: env.LOCATION, manifestPattern: 'server-deploy.yaml', credentialsId: env.CREDENTIALS_ID, verifyDeployments: true])
            }
	}
    }    
}
