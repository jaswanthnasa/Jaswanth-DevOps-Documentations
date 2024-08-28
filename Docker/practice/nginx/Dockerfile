# Use the official Nginx image from the Docker Hub
FROM nginx:alpine

# Remove the default Nginx index.html
RUN rm /usr/share/nginx/html/index.html

# Copy the sample web application to the Nginx HTML directory
COPY index.html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
