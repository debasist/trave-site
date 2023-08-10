# Use an official Node.js runtime as the base image
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire application code to the container
COPY . .

# Build the React app
RUN npm run build

# Expose a port (change this if your React app uses a different port)
EXPOSE 3000

# Command to start the application
CMD ["npm", "start"]