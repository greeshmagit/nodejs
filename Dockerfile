FROM node:14-alpine
WORKDIR /app
COPY package.json .
RUN npm install
RUN npm run test
COPY . .
EXPOSE 8080
CMD ["node", "app.js"]
