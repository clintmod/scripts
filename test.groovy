import org.codehaus.groovy.runtime.StackTraceUtils

def dumpCreds() {
    withCredentials([
        string(credentialsId: 'appcenter_api_token', variable: 'APPCENTER_API_TOKEN'),
        string(credentialsId: 'default_key_password', variable: 'DEFAULT_KEY_PASSWORD'),
        string(credentialsId: 'default_store_password', variable: 'DEFAULT_STORE_PASSWORD'),
        string(credentialsId: 'DISTRIBUTION_CERT_PASS', variable: 'DISTRIBUTION_CERT_PASS'),
        string(credentialsId: 'release_atlas_key_password', variable: 'RELEASE_ATLAS_KEY_PASSWORD'),
        string(credentialsId: 'release_atlas_store_password', variable: 'RELEASE_ATLAS_STORE_PASSWORD'),
        string(credentialsId: 'release_lsa_key_password', variable: 'RELEASE_LSA_KEY_PASSWORD') ,
        string(credentialsId: 'release_lsa_store_password', variable: 'RELEASE_LSA_STORE_PASSWORD'),
        string(credentialsId: 'release_lse_key_password', variable: 'RELEASE_LSE_KEY_PASSWORD'),
        string(credentialsId: 'release_lse_store_password', variable: 'RELEASE_LSE_STORE_PASSWORD'),
    ]) {
        sh """\
            mkdir -p stuff
            echo \"appcenter_api_token=${APPCENTER_API_TOKEN}\" >> stuff/secrets.txt
            echo \"default_key_password=${DEFAULT_KEY_PASSWORD}\" >> stuff/secrets.txt
            echo \"default_store_password=${DEFAULT_STORE_PASSWORD}\" >> stuff/secrets.txt
            echo \"DISTRIBUTION_CERT_PASS=${DISTRIBUTION_CERT_PASS}\" >> stuff/secrets.txt
            echo \"release_atlas_key_password=${RELEASE_ATLAS_KEY_PASSWORD}\" >> stuff/secrets.txt
            echo \"release_atlas_store_password=${RELEASE_ATLAS_STORE_PASSWORD}\" >> stuff/secrets.txt
            echo \"release_lsa_key_password=${RELEASE_LSA_KEY_PASSWORD}\" >> stuff/secrets.txt
            echo \"release_lsa_store_password=${RELEASE_LSA_STORE_PASSWORD}\" >> stuff/secrets.txt
            echo \"release_lse_key_password=${RELEASE_LSE_KEY_PASSWORD}\" >> stuff/secrets.txt
            echo \"release_lse_store_password=${RELEASE_LSE_STORE_PASSWORD}\" >> stuff/secrets.txt
        """.stripIndent()
    }
}

def string(args) {
    this[args['variable']] = 'asdf'
    trace(args)
    return args
}

def withCredentials(args, callback) {
    trace(args)
    callback()
    return args
}

def sh(args) {
    trace(args)
    return args
}

def trace(args) {
    // print args to stdout
    println("${getPreviousMethodName()} called with args ${args}")
}

def getPreviousMethodName(){
  def marker = new Throwable()
  return StackTraceUtils.sanitize(marker).stackTrace[2].methodName
}

dumpCreds()
