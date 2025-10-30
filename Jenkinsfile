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

    stage('Deploy') {
        echo 'Deploying to test server...'
        // Simulated deploy step — replace with real command
        sh '''
        docker build -t sample-app:latest .
        docker run -d -p 8081:8080 sample-app:latest
        '''
    }

    stage('Post-Deployment Check') {
        echo 'Verifying deployment...'
        sh 'curl -I http://localhost:8081 || echo "Service not responding"'
    }

    echo 'CI/CD Pipeline execution completed successfully!'
}

