// @Library('my-shared-library') _

// pipeline{

//     agent any
//     parameters{
//         choice(name: 'action', choices: 'create\ndelete', description: 'choose Create/Destroy')
//         string(name: 'ImageName', description: "name of docker build", defaultValue: 'javapp')
//         string(name: 'ImageTag', description: "tag of docker build", defaultValue: 'v1')
//         string(name: 'Appname', description: "name of the Application ", defaultValue:'springboot')
//     }
//     stages{

//         stage("Git CheckOut") {
//              when {expression { params.action == 'create'} }

//             steps{

//                 script{

//                      gitCheckout(
//                         branch: "main",
//                         url: "https://github.com/MateenShaikh640/Devops_Projects.git"
                        
//                      )

//                 }
//             }
//          }
//          stage("maven test") {
//                   when {expression { params.action == 'create'} }
//             steps{

//                 script{

//                        mvnTest()
//                 }
//             }
//         }
//         stage("integration test") {
//              when {expression { params.action == 'create'} }
//             steps{

//                 script{

//                       mvnintegationTest()
//                 }
//             }
//         }
//                 stage("static code analysis: sonarqube") {
//                 when {expression { params.action == 'create'} }
//                 steps{

//                 script{
//                       def SonarQubecredentialsId = 'sonar-token'
//                       staticCodeAnalysis(SonarQubecredentialsId)
//                 }
//             }
//         }
//             stage("Quality Gate: sonarqube") {
//                 when {expression { params.action == 'create'} }
//                 steps{

//                 script{
//                       def SonarQubecredentialsId = 'sonar-token'
//                       QualityGateStatus(SonarQubecredentialsId)
//                 }
//             }
//         }
//             stage("maven Build: Maven") {
//                 when {expression { params.action == 'create'} }
//                 steps{

//                 script{
//                      mvnBuild()
//                 }
//             }
//         }
//             stage('Docker image build') {
//                 when {expression { params.action == 'create'} }
//                 steps{

//                 script{
//                      dockerBuild("${params.ImageName}","${params.ImageTag}","${params.Appname}")
//                 }
//             }
//         }
//     }
//     //if you execute post stage when only when job get faile
//     //     post {
//     //         failure {
//     //              steps {
//     //                 script {
//     //                     echo "Cleaning workspace due to failure..."
//     //                     cleanWs()
//     //             }
//     //         }
//     //     }
//     // }
//             post {
//                   always {
//         echo "This will run always, regardless of build result"
//         cleanWs()
//     }
//     }

 
// }

@Library('my-shared-library') _

pipeline {
    agent any
    parameters {
        choice(name: 'action', choices: 'create\ndelete', description: 'Choose Create/Destroy')
        string(name: 'ImageName', description: "Name of docker build", defaultValue: 'javapp')
        string(name: 'ImageTag', description: "Tag of docker build", defaultValue: 'v1')
        string(name: 'Appname', description: "Name of the Application", defaultValue: 'springboot')
    }
    stages {
        stage("Git CheckOut") {
            when { expression { params.action == 'create' } }
            steps {
                timeout(time: 2, unit: 'MINUTES') {
                    script {
                        gitCheckout(
                            branch: "main",
                            url: "https://github.com/MateenShaikh640/Devops_Projects.git"
                        )
                    }
                }
            }
        }
        stage("maven test") {
            when { expression { params.action == 'create' } }
            steps {
                timeout(time: 2, unit: 'MINUTES') {
                    script {
                        mvnTest()
                    }
                }
            }
        }
        stage("integration test") {
            when { expression { params.action == 'create' } }
            steps {
                timeout(time: 2, unit: 'MINUTES') {
                    script {
                        mvnintegationTest()
                    }
                }
            }
        }
        stage("static code analysis: sonarqube") {
            when { expression { params.action == 'create' } }
            steps {
                timeout(time: 2, unit: 'MINUTES') {
                    script {
                        def SonarQubecredentialsId = 'sonar-token'
                        staticCodeAnalysis(SonarQubecredentialsId)
                    }
                }
            }
        }
        stage("Quality Gate: sonarqube") {
            when { expression { params.action == 'create' } }
            steps {
                timeout(time: 2, unit: 'MINUTES') {
                    script {
                        def SonarQubecredentialsId = 'sonar-token'
                        QualityGateStatus(SonarQubecredentialsId)
                    }
                }
            }
        }
        stage("maven Build: Maven") {
            when { expression { params.action == 'create' } }
            steps {
                timeout(time: 2, unit: 'MINUTES') {
                    script {
                        mvnBuild()
                    }
                }
            }
        }
        stage('Docker image build') {
            when { expression { params.action == 'create' } }
            steps {
                timeout(time: 2, unit: 'MINUTES') {
                    script {
                        dockerBuild("${params.ImageName}", "${params.ImageTag}", "${params.Appname}")
                    }
                }
            }
        }
    }
    post {
        always {
            echo "This will run always, regardless of build result"
            cleanWs()
        }
    }
}



