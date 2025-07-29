FROM node:20
# Install dependencies for node-canvas
RUN apt-get update && apt-get install -y \
  libcairo2-dev \
  libjpeg-dev \
  libpango1.0-dev \
  libgif-dev \
  build-essential \
  g++
WORKDIR /app
COPY package*.json ./
RUN npm install --force && cat /root/.npm/_logs/*.log && sleep 30
COPY . .
CMD ["node", "server.js"]
