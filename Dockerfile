# Dockerfile
FROM node:18

# Set working directory
WORKDIR /app

COPY prisma/migrations /app/prisma/migrations

RUN chmod -R 777 /app/prisma/migrations

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy application files
COPY . .

# Expose port
EXPOSE 3000

# Start the application
CMD [ "sh", "-c", "npm run db:deploy && npm run start" ]