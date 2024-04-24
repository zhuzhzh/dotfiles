# Golang
if [[ -z "${PUBLIC_TOOLS}" ]]; then
	PUBLIC_TOOLS = /home/public
fi
export GOLANG_HOME=${PUBLIC_TOOLS}/go
export GOROOT=${PUBLIC_TOOLS}/go
export PATH="${GOROOT}/bin:/opt/go/bin:${PATH}"
export GOPATH="/opt/go:/trunk/branch/go"

# 配置 GOPROXY 环境变量
export GOPROXY=https://mirrors.aliyun.com/goproxy/,direct

