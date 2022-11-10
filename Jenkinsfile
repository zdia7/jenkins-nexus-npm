@Library('my-shared-library') _
 
node { 
    env.NODEJS_HOME = "${tool 'nodejs'}" 
    env.PATH = "${env.NODEJS_HOME}/bin:${env.PATH}" 
    
    buildJavascriptApp deploy : false, { 
        notify type : "slack", message : "Construction réussie" 
    } 
}