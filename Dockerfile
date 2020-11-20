FROM node:12
WORKDIR /usr/src/app
COPY package*.json ./
RUN yarn install
COPY . .
EXPOSE 8080
USER node
CMD [ "node", "index.js" ]
