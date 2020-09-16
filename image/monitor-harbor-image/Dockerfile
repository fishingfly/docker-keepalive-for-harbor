FROM osixia/keepalived:stable
MAINTAINER zhounanjun

ADD ./check.sh /etc/keepalived/harbor_check.sh
RUN chmod +x /etc/keepalived/harbor_check.sh

ADD ./keepalived.conf /container/service/keepalived/assets/keepalived.conf
