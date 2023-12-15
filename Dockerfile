FROM node:16
WORKDIR /usr/src/app
RUN git clone https://github.com/SDVR21/JenFlown.git .
RUN npm install

EXPOSE 5000
CMD ["node", "app.js"]
