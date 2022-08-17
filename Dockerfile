FROM alpine:edge

ARG AUUID="f01b8d17-76c2-489b-b3c4-5065c01a2b57"
ARG CADDYIndexPage="https://github.com/sweetield/indexpage/blob/main/README.md"
ARG ParameterSSENCYPT="chacha20-ietf-poly1305"
ARG PORT=8080

ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/xray.json /tmp/xray.json
ADD deploy.sh /deploy.sh
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates bash caddy tor unzip wget && \
    bash deploy.sh

RUN chmod +x /start.sh

CMD /start.sh
