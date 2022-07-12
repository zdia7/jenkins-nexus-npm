pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('kubernetesdevops-4eb03886-1730-4193-a4a1-79b586335865')
	}

	stages {

		stage('Build') {

			steps {
				sh 'docker build -t bharathirajatut/nodeapp:latest .'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push bharathirajatut/nodeapp:latest'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}
