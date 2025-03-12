# Dockerfile
FROM node:18

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./
COPY prisma ./prisma/
# Copy migrations folder inside prisma
COPY prisma/migrations ./prisma/migrations/

# Install dependencies
RUN npm install

# Copy application files
COPY . .

# Expose port
EXPOSE 3000

# Start the application
CMD [ "sh", "-c", "npm run db:deploy && npm run start" ]