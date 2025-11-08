FROM node:18-alpine
WORKDIR /app
COPY PACKAGE*.json ./
RUN npm install
COPY . .
CMD ["node", "dist/main"]
EXPOSE 3000
