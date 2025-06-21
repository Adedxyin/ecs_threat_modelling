# Dockerfile for a React application
# This Dockerfile builds a React application and serves it using a lightweight server.
# Using an official Node image
# Using an official Node image
FROM node:18-alpine

# Set working directory inside container
WORKDIR /app

# Copy dependency files
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install

# Copy the rest of the app
COPY . .

# Build the app (static files in /build)
RUN yarn build

# Install lightweight server and expose port 3000
RUN yarn global add serve
EXPOSE 3000

# Start the server
CMD ["serve", "-s", "build"]