@Library('my-shared-library') _

pipeline{

    agent any
    stages{

        stage("Git CheckOut") {

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

            steps{

                script{

                       mvnTest()
                }
            }
        }
    }
}


