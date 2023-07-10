FROM node:20

WORKDIR /home/node
RUN npm install proxy-chain
ADD app.js /home/node/app.js

ENTRYPOINT ["node", "/home/node/app.js"]