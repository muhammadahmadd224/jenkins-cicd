FROM node:18-alpine

# Set working directory inside the container
WORKDIR /app

# Copy dependency files first (case-sensitive)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your source code
COPY . .

# ✅ Build the NestJS project (TypeScript → dist folder)
RUN npm run build

# Expose your app port
EXPOSE 3000

# Start the app
CMD ["node", "dist/main"]
