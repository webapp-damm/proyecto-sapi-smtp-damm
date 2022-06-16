pipeline {
  environment {
    // Environment variables (edit)
    PROJECT_NAME = 'smtp-damm' //Nombre de proyecto sin incluir sufijo -web. Por ejemplo: helloworld-setup-damm
    PREFIX = 'proyecto' // Prefijo del nombre del proyecto. Por ejemplo: proyecto
    LAYER = 'sapi' //Capa de la API. Por ejemplo 'papi'
    ENVIRONMENT_DES = 'deswemulesoft' //Nombre del entorno de DES. Por ejemplo: 'deswemulesoft'
    ENVIRONMENT_INT = 'intwemulesoft'  //Nombre del entorno de INT. Por ejemplo: 'intwemulesoft'
    ENVIRONMENT_PROD = 'prodwemulesoft'  //Nombre del entorno de PROD. Por ejemplo: 'prodwemulesoft'
    RESOURCE_GROUP_DES = 'Des-We-AKSMULESOFT-RG42' //Nombre del grupo de recursos del entorno DES en Azure. Por ejemplo 'Des-We-AKSMULESOFT-RG42'
    KUBERNETES_SERVICE_DES = 'Des-We-AKSMULESOFT-AKS01'//Nombre del service Kub del entorno DES en Azure. Por ejemplo: 'Des-We-AKSMULESOFT-AKS01'
    RESOURCE_GROUP_INT = 'Int-We-AKSMULESOFT-RG50' //Nombre del grupo de recursos del entorno INT en Azure. Por ejemplo 'Int-We-AKSMULESOFT-RG50'
    KUBERNETES_SERVICE_INT = 'Int-We-AKSMULESOFT-AKS01'//Nombre del service Kub del entorno INT en Azure. Por ejemplo: 'Int-We-AKSMULESOFT-AKS01'
    RESOURCE_GROUP_PROD = 'Prod-We-AKSMULESOFT-RG44' //Nombre del grupo de recursos del entorno PROD en Azure. Por ejemplo: 'Prod-We-AKSMULESOFT-RG44'
    KUBERNETES_SERVICE_PROD = 'Prod-We-AKSMULESOFT-AKS01' //Nombre del service Kub del entorno PROD en Azure. Por ejemplo: 'Prod-We-AKSMULESOFT-AKS01'
    KUBERNETES_DELETE = 'x' //Nombre del despliegue en Kubernetes que se eliminará antes de aplicar el nuevo. Por ejemplo: 'eapi-jenkins-cicd-dev-runtime-damm'
    API_VERSION = '1.0.0' //Versión de la API. Por ejemplo 1.0.0
    
    //Mulesoft (not edit)
    MULESOFT_USER = credentials('MULESOFT_USER')
    MULESOFT_PASSWORD = credentials('MULESOFT_PASSWORD')
  }
  agent {
    label 'master'
  }
  options {
    office365ConnectorWebhooks(getTeamsWebhookParams())
  }
  stages {
    stage('Set workspace variables') {
      steps {
        echo 'Starting set workspace variables'
        setWorkspaceVariables("${env.BRANCH_NAME}")
        echo 'Set workspace variables completed'
      }
    }
    stage('Get Autodiscovery'){
      steps {
        script {
          echo 'Starting get autodiscovery'
          getApiAutodiscovery()
          echo 'Get autodiscovery completed'
        }
      }
    }
    stage('Inject Autodiscovery') {
      steps {
        echo 'Starting autodiscovery injection'
        script {
          injectApiAutodiscovery()
        }
        echo 'Autodiscovery injection completed'
      }
    }
    stage('Get API Spec version') {
      steps {
        echo 'Starting get API spec version'
        script {
          getApiSpecVersion()
        }
        echo 'Get API spec version completed'
      }
    }
    stage ('Patch API Spec version'){
      steps {
        echo 'Starting patch API spec version'
        script {
          patchApiSpecVersion()
        }
        echo 'Patch API spec version completed'
      }
    }
    stage('Unit Test') {
      steps {
        echo 'Starting unit testing'
        mvnTest()
        echo 'Unit testing completed'
      }
    }
    stage('Build artifact') {
      steps {
        echo 'Starting artifact building'
        mvnBuild()
        echo 'Artifact building completed'
      }
    }
    stage('Connect Azure') {
      steps {
        connectAzure()
      }
    }
    stage('Build image') {
      steps {
        echo 'Starting image building'
        buildImage("${env.BRANCH_NAME}")
        echo 'Image building completed'
      }
    }
    stage('Push image') {
      steps {
        echo 'Starting image push to container registry'
        pushImage("${env.BRANCH_NAME}")
        echo 'Image push to container registry completed'
      }
    }
    stage('SonarQube analysis') {
      steps {
        echo 'Starting SonarQube analysis'
        sonarAnalysis()
        echo 'SonarQube analysis completed'
      }
    }
    stage('Quality Gate') {
      steps {
        echo 'Starting Quality Gate check'
        sonarQualityGateCheck()
        echo 'Quality Gate check completed'
      }
    }
    stage('Deployment') {
      steps {
        echo 'Starting deployment'
        deploy("${env.BRANCH_NAME}")
        echo 'Deployment completed'
      }
    }
  }
  post {
    always {
      postActions()
    }
  }
}
