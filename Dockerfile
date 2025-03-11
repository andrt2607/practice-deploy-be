# Dockerfile
FROM node:18

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Install Prisma CLI globally (opsional jika tidak ada di dependencies)
RUN npm install -g prisma

# Install PostgreSQL client
# RUN apt-get update && apt-get install -y postgresql-client

# Generate Prisma Client
# RUN npx prisma generate --schema=./prisma/schema.prisma

#Copy prisma schema file
# COPY prisma/schema.prisma ./prisma/
COPY prisma ./prisma/

# Copy application files
COPY . .

# Expose port
EXPOSE 3000

# Start the application
# CMD ["npm", "start"]
CMD [ "sh", "-c", "npm run db:deploy && npm run start" ]