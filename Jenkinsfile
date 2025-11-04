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

    stage('Build Docker Image') {
        echo 'Building Docker image...'
        sh '''
        docker build -t java-webapp:latest .
        docker images | grep java-webapp
        '''
    }

    stage('Deploy to Container') {
        echo 'Deploying to Docker container...'
        sh '''
        docker stop javaweb || true
        docker rm javaweb || true
        docker run -d --name javaweb -p 8081:8080 java-webapp:latest
        '''
    }

    stage('Post-Deployment Check') {
        echo 'Verifying application is running...'
        sh 'sleep 5 && curl -I http://localhost:8081 || true'
    }
}

