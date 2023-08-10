FROM node:18-alpine

WORKDIR /

COPY package.json package.json

COPY package-lock.json package-lock.json

RUN  npm ci

RUN npm run build

FROM httpd:alpine

COPY public/ public

COPY src/ src

RUN npm install

EXPOSE 3000

CMD [ "npm", "start" ]

