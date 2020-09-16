#!/bin/bash
#url=${HARBOR_HEALTH_URL}
url=http://10.142.113.169/api/health

function httpRequest()
{
    #curl 请求
    info=`curl $1 -k`
    echo $info
    if [[ $info =~ "unhealth" ]] || [[ $info =~ "error" ]] || [[ $info =~ "NOT FOUND" ]] || [[ $info == "" ]]; then
	echo "harbor is not ok"
        exit 1
    else
	if [[ $info =~ "healthy" ]]; then
		echo "harbor is ok"
        	exit 0
        else
		echo "harbor is not ok"
	        exit 1
	fi
    fi
}

httpRequest $url
