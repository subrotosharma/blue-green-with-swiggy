# Use Node.js 16 as the base image
FROM node:16

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy source code
COPY . .

# Build the production-ready React app
RUN npm run build

# Install `serve` to serve the static build
RUN npm install -g serve

# Expose the port the app will run on
EXPOSE 3000

# Start the app with serve
CMD ["serve", "-s", "build", "-l", "3000"]
