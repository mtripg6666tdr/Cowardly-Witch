FROM node:10.24.1-buster-slim
RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y --no-install-recommends python2 g++ make
WORKDIR /site
COPY . .
RUN yarn
RUN yarn lint -- --fix
RUN yarn build:prod

CMD ["/bin/sh", "-c", "sleep infinity"]