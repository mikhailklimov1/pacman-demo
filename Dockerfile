FROM node:12.18.1
ENV NODE_ENV=production

WORKDIR /app

COPY ["pacman-demo-app/package.json", "package-lock.json*", "./"]

RUN npm install --production

COPY ./pacman-demo-app/ .

EXPOSE 8080

CMD [ "node", "server.js" ]
