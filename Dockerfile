# 1. Use an official Node.js image (Node 18 is stable and great for Mineflayer)
FROM node:18

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Copy only package files first (This is the cache trick for faster updates!)
COPY package.json package-lock.json* ./

# 4. Install your Node.js dependencies
RUN npm install

# 5. Copy the rest of your bot's files into the container
COPY . .

# 6. Expose the default port your app uses if process.env.PORT is missing
EXPOSE 5000

# 7. The command to wake your bot up
CMD ["npm", "start"]
