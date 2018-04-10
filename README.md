# rpi-docker-node-sonos-http-api
Docker wrapper for https://github.com/jishi/node-sonos-http-api for running on a Raspberry Pi.

[![Docker Stars](https://img.shields.io/docker/stars/jonmaddox/rpi-docker-node-sonos-http-api.svg)](https://hub.docker.com/r/jonmaddox/rpi-docker-node-sonos-http-api)
[![Docker Pulls](https://img.shields.io/docker/pulls/jonmaddox/rpi-docker-node-sonos-http-api.svg)](https://hub.docker.com/r/jonmaddox/rpi-docker-node-sonos-http-api)

## Usage
Refer to https://github.com/jishi/node-sonos-http-api for all the configuration detail

First make the config and local dirs up
```bash
mkdir clips
mkdir settings
mkdir cache
mkdir presets
curl https://raw.githubusercontent.com/jishi/node-sonos-http-api/master/presets/example.json > presets/example.json
echo {} > settings/settings.json
```

Then run the docker image
```bash
docker run \
  --net=host \
  --name sonos \
  --restart=always \
  -d \
  -v `pwd`/settings:/app/settings \
  -v `pwd`/clips:/app/static/clips \
  -v `pwd`/cache:/app/cache \
  -v `pwd`/presets:/app/presets \
  jonmaddox/rpi-docker-node-sonos-http-api
```

This wrapper was based on [@chrisns](https://github.com/chrisns)'s [x86 wrapper](https://github.com/chrisns/docker-node-sonos-http-api).
