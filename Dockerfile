# Dockerfile
FROM node:lts-alpine3.17

# Set working directory
WORKDIR /usr/src/app

COPY package.json package-lock.json ./

# Install dependencies
RUN npm ci

# Copy application files
COPY . .

RUN npm ci

COPY . .

CMD ["sh", "-c", "npm run db:deploy && npm run start"]