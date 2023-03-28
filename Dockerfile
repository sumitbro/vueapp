# Name the node stage "builder"

FROM node:lts-alpine as builder


WORKDIR /app

# Copy the package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy rest of the files
COPY . .

# Build the project
RUN npm run build

# for nginx
# nginx state for serving content

FROM nginx:stable-alpine as production-stage


# Set working directory to nginx asset directory
WORKDIR /usr/share/nginx/html
# Remove default nginx static assets
RUN rm -rf ./*
# Copy static assets from builder stage
COPY --from=builder /app/dist .
# Containers run nginx with global directives and daemon off
ENTRYPOINT ["nginx", "-g", "daemon off;"]
