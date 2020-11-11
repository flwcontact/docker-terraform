# specifying stable version to avoid bugs from 'latest' images
FROM node:15.1.0-alpine3.10

WORKDIR /app

COPY . /app/

# install dependencies and to ensure a cleaner installation 
RUN npm i &&\
    npm ci 

EXPOSE 8080

CMD [ "npm", "run", "start" ]
