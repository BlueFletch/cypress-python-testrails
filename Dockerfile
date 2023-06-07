# Use an official Node.js image as the base
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Install required dependencies
RUN apt-get update && \
    apt-get install -y python3-pip git && \
    npm install -g cypress

# Copy package.json and package-lock.json (if exists)
COPY package*.json ./


# Install npm dependencies
RUN npm install

# Install TestRail CLI
RUN pip3 install trcli

# Copy the application code to the container
COPY . .

# Set any required environment variables (if applicable)
# ENV VARIABLE_NAME=value

# Expose any required ports (if applicable)
# EXPOSE port_number

# Define the default command to run when the container starts
CMD ["npx", "cypress", "-v"]
