# Use a lightweight Node.js image as the base
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies first (better caching)
COPY package.json package-lock.json ./

# Install only production dependencies
RUN npm install --production

# Copy the application source code to the container
COPY . .

# Expose the application port
EXPOSE 3000

# Define the startup command
CMD ["node", "server.js"]