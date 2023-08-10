FROM node:18-alpine

WORKDIR /

# COPY package.jkage-lock.json
# son package.json

# COPY . .


# Copy package.json and package-lock.json
COPY package*.json ./


RUN npm run build


RUN npm install

EXPOSE 3000

CMD [ "npm", "start" ]

