# Use Node.js 20 Alpine version
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy dependency files first
COPY package*.json ./

# Install NestJS CLI globally + dependencies
RUN npm install -g @nestjs/cli \
    && npm install

# Copy rest of the source code
COPY . .

# Build the NestJS app
RUN npm run build

# Expose port
EXPOSE 3000

# Start the application
CMD ["node", "dist/main"]
