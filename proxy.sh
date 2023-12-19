
export http_proxy=socks4://127.0.0.1:50125
export https_proxy=$http_proxy
export HTTP_PROXY=$http_proxy
export HTTPS_PROXY=$http_proxy
export JAVA_FLAGS=-Dhttp.proxyHost=$http_proxy
