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

CMD ["pm2", "start", "main.js", "\",
       "pm2", "save", "\",
       "pm2", "logs"
       ]