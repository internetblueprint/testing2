# Step 1: Base image
FROM node:18-alpine AS base
WORKDIR /app
COPY package*.json ./

# Step 2: Install deps
RUN npm install

# Step 3: Build
COPY . .
RUN npx prisma generate
RUN npm run build

# Step 4: Run
EXPOSE 3000
CMD ["npm", "start"]
