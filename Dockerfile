# Step 1: Build the React Vite project
FROM node:18-alpine AS build

WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the project
COPY . .

# Build the project
RUN npm run build

# Step 2: Serve the build with Nginx
FROM nginx:alpine

# Copy build output from step 1
COPY --from=build /app/dist /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Run Nginx
CMD ["nginx", "-g", "daemon off;"]
