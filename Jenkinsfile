@Library('my-shared-library') _

pipeline{

    agent any
    parameters{
        choice(name: 'action', choices: 'create\ndelete', description: 'choose Create/Destroy')
    }
    stages{

        stage("Git CheckOut") {
             when {expression { param.action == 'create'} }

            steps{

                script{

                     gitCheckout(
                        branch: "main",
                        url: "https://github.com/MateenShaikh640/Devops_Projects.git"
                        
                     )

                }
            }
        }
         stage("maven test") {
                  when {expression { params.action == 'create'} }
            steps{

                script{

                       mvnTest()
                }
            }
        }
        stage("integration test") {
             when {expression { params.action == 'create'} }
            steps{

                script{

                      mvnintegationTest()
                }
            }
        }
                stage("static code analysis: sonarqube") {
             when {expression { params.action == 'create'} }
            steps{

                script{
                      def SonarQubecredentialsId = 'sonar-token'
                      staticCodeAnalysis(SonarQubecredentialsId)
                }
            }
        }
    }
}


