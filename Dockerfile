# This is a multi-stage Dockerfile and requires >= Docker 17.05
# https://docs.docker.com/engine/userguide/eng-image/multistage-build/
FROM node:alpine

WORKDIR /forum

# this will cache the npm install step, unless package.json changes
ADD package.json .
ADD package-lock.json .
RUN npm install 
ADD . .
CMD [ "npm", "start" ]
