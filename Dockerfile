FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .

RUN npm install && npm install pm2 -g 

COPY . .

EXPOSE 5000

CMD ["npm", "run", "start"]

CMD ["pm2", "start", "main.js"]

CMD ["pm2", "save"]

CMD ["pm2", "logs"]