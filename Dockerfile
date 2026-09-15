# Base images
FROM node:18-alpine

# Working Directory
WORKDIR /app

# Copy Package.json
COPY package.json .

# Install Dependencies (if any)
RUN npm install

#Copy code 
COPY app.js .

# Expose Port
EXPOSE 3000

# App start
CMD ["npm", "start"]
