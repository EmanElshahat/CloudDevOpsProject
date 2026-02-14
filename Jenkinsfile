@Library('jenkins-shared-library') _

pipeline {
    agent any

    environment {
        IMAGE_NAME = "emanabosamra/app:latest"
    }

    stages {

        stage('Build Image') {
            steps {
                dockerBuild(IMAGE_NAME)
            }
        }

        stage('Scan Image') {
            steps {
                sh "trivy image --severity HIGH,CRITICAL --exit-code 0 ${IMAGE_NAME}"
            }
        }

        stage('Push Image') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh """
                    echo \$DOCKER_PASS | docker login -u \$DOCKER_USER --password-stdin
                    docker push ${IMAGE_NAME}
                    """
                }
            }
        }

        stage('Delete Image Locally') {
            steps {
                dockerRemove(IMAGE_NAME)
            }
        }

        stage('Update Manifests') {
            steps {
                sh """
                sed -i 's|image: .*|image: ${IMAGE_NAME}|' K8s/deployment.yaml
                """
            }
        }

        stage('Push Manifests') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'github-creds',
                    usernameVariable: 'GIT_USER',
                    passwordVariable: 'GIT_PASS'
                )]) {
                    sh """
                    git config user.email "jenkins@ci.com"
                    git config user.name "jenkins"
                    git add .
                    git commit -m "Update image tag via Jenkins"
                    git push https://\$GIT_USER:\$GIT_PASS@github.com/EmanElshahat/CloudDevOpsProject.git
                    """
                }
            }
        }
    }
}

