FROM mhart/alpine-node:6.2.0
MAINTAINER saikocat

ENV SERVICE_USER=app
ENV PERSISTENT_DIR=/data/kinesalite

# Install deps
RUN apk add --update python make g++ \
	&& npm install --unsafe-perm -g kinesalite@1.11.5 \
	&& apk del python make g++ \
	&& rm -rf /tmp/* /var/cache/apk/*

# Service user and expose dir if you decided to use --path and leveldb
RUN addgroup -g 999 $SERVICE_USER \
	&& adduser -D -G $SERVICE_USER -s /bin/false -u 999 $SERVICE_USER \
	&& mkdir -p $PERSISTENT_DIR \
	&& chown -R $SERVICE_USER:$SERVICE_USER $PERSISTENT_DIR
VOLUME ["$PERSISTENT_DIR"]

EXPOSE 4567

USER app

ENTRYPOINT ["/usr/bin/kinesalite"]

CMD ["--help"]
