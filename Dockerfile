FROM resin/raspberry-pi-alpine-node

WORKDIR /app

RUN apk --no-cache add tar curl && \
  curl -L https://github.com/jishi/node-sonos-http-api/archive/master.tar.gz | tar xz --strip-components=1 -C /app && \
  mkdir cache && \
  ln -s settings/settings.json && \
  npm install --production && \
  rm -rf /tmp/* /root/.npm

EXPOSE 5005

HEALTHCHECK --interval=1m --timeout=2s \
  CMD curl -LSs http://localhost:5005 || exit 1

CMD npm start
