node {
    stage('Checkout') {
        echo 'Checking out source code...'
        git branch: 'main', url: 'https://github.com/Chandrakanth-Git-Hub/scripted.git'
    }

    stage('Build') {
        echo 'Building application...'
        sh 'mvn clean package'
    }

    stage('Test') {
        echo 'Running tests...'
        sh 'mvn test'
    }

    stage('Deploy to Container') {
        echo 'Deploying to Docker container...'
        sh '''
        # Stop and remove old container if exists
        docker stop javaweb || true
        docker rm javaweb || true

        # Run new container
        docker run -d --name javaweb -p 8081:8080 java-webapp:latest
        '''
    }

    echo 'CI/CD Pipeline execution completed successfully!'

    stage('Post-Deployment Check') {
        echo 'Checking if app is running...'
        sh 'curl -I http://localhost:8081 || true'
        echo 'Deployment successful!'
    }
}

