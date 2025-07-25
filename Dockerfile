FROM node:18-alpine

WORKDIR /app

# Copy and install dependencies
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production

# Copy the rest of the app
COPY . .

# Set OpenSSL legacy mode before build
ENV NODE_OPTIONS=--openssl-legacy-provider

# Build the app
RUN npm run build

# Expose the port the app runs on
EXPOSE 3000

# Start the app
CMD ["npm", "start"]