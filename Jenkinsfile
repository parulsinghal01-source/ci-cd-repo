pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                url: 'https://github.com/parulsinghal01-source/ci-cd-repo'
            }
        }
	stage('Verify Environment') {
		steps {
		   sh '''
                      which python3
                      python3 --version
                      python3 -m pip list
                      pytest --version || true
                  '''
    }
}
        stage('Install Dependencies') {
            steps {
                sh '''
		    python3 -m pip install --upgrade pip setuptools wheel
		    python3 -m pip install -r  requirements.txt
		    python3 -m pip install pytest
		'''
            }
        
        }  
        stage('Run tests') {
            steps {
                sh 'python3 -m pytest test/'
            }
        }
        stage('Code Quality') {
            steps {
                sh 'flake8 app/'
            }
        }   
        stage('Release Versioning') {
            steps {
                sh './scripts/release.sh'
            }
        }
        stage('Deploy') {
            steps {
                sh './scripts/deploy.sh'
            }
        }

    }
}
