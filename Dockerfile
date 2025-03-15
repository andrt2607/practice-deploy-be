# Dockerfile
FROM node:lts-alpine3.17

# Set working directory
WORKDIR /usr/src/app

COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy application files
COPY . .

CMD ["sh", "-c", "npm run db:deploy && npm run start"]