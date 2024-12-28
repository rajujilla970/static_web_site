# Use an official Nginx image from Docker Hub
FROM nginx:alpine

# Copy the index.html file into the Nginx server directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80 to make the web server accessible
EXPOSE 80

# Start Nginx when the container runs
CMD ["nginx", "-g", "daemon off;"]

