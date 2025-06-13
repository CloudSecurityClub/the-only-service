# Base image for our service
# We do not have a way to authenticate to the private registry, so we are using the public registry.
FROM public.ecr.aws/i8x8s1y9/the-only-service:latest

# Set working directory
WORKDIR /app

# Copy package files first (for better caching)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy application code file
COPY . .

# Added in the first iteration, no more needed so commenting out and removing it.
# COPY .env .
RUN rm -f .env

# Build the application
RUN npm run build

# Expose port
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
