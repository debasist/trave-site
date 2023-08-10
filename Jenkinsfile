pipeline {
    agent any

    stages {
        stage("Code Clone") {
            steps {
                echo "Cloning the code"
                git url: "https://github.com/debasist/travel-site.git", branch: "main"
            }
        }
        
        stage("Build") {
            steps {
                echo "Build the image"
                sh "docker build -t travel-site ."
            }
        }
        stage("Push to Docker Hub"){
            steps{
                echo "Pushing the image to DockerHub"
                withCredentials([usernamePassword(credentialsId: "debasistripathy01", passwordVariable: "dockerHubPass", usernameVariable: "debasistripathy01")])
                sh "docker tag travel-site ${env.debasistripathy01}/travel-site:latest"
                sh "docker login -u ${env.debasistripathy01} -p ${env.dockerHubPass}"
                sh "docker push ${env.debasistripathy01}/travel-site:latest"
                
            }
        }
        stage("Deploy"){
            steps{
                echo "Deploying the container"
                sh "docker run -d -p 3000:3000 debasistripathy01/travel-site:latest"
            }
        }
    }
}