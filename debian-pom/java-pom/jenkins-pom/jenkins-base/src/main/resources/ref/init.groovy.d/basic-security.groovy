#!groovy

import jenkins.model.*
import hudson.security.*

println "--> creating local user 'admin'"

def instance = Jenkins.getInstance()
def hudsonRealm = new HudsonPrivateSecurityRealm(false)
def strategy = new FullControlOnceLoggedInAuthorizationStrategy()

hudsonRealm.createAccount('admin','admin')
instance.setSecurityRealm(hudsonRealm)
instance.setAuthorizationStrategy(strategy)
instance.save()

println "--> delete this script file"

def scriptFile = new File(getClass().protectionDomain.codeSource.location.path)
scriptFile.delete()