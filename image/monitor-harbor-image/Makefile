VERSION ?= v1.0

image:
	docker build -t nanjun/keepalived:${VERSION} .

run-error:
	docker run --cap-add=NET_ADMIN --net=host -d --name harbor-keepalived --restart always --env KEEPALIVED_VIRTUAL_IPS="#PYTHON2BASH:['10.142.113.44/24']" --env KEEPALIVED_UNICAST_PEERS="#PYTHON2BASH:['10.142.113.41/24','10.142.113.40/24']" --env KEEPALIVED_PRIORITY=150 --env KEEPALIVED_STATE=MASTER  --env KEEPALIVED_INTERFACE=ens160 --env HARBOR_HEALTH_URL=http://10.142.113.169/api/health  --detach nanjun/keepalived:${VERSION} --loglevel debug

run-success:
	docker run --cap-add=NET_ADMIN --net=host -d --name harbor-keepalived --restart always --env KEEPALIVED_VIRTUAL_IPS="#PYTHON2BASH:['10.142.113.44/24']" --env KEEPALIVED_UNICAST_PEERS="#PYTHON2BASH:['10.142.113.40/24','10.142.113.41/24']" --env KEEPALIVED_PRIORITY=140 --env KEEPALIVED_STATE=BACKUP  --env KEEPALIVED_INTERFACE=ens160 --env HARBOR_HEALTH_URL=https://10.142.113.41/api/v2.0/health  --detach nanjun/keepalived:${VERSION}
clean:
	docker stop harbor-keepalived && docker rm harbor-keepalived
