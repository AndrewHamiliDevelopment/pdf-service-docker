FROM debian:stable-slim
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    ca-certificates \
    procps \
    libxss1 \
    libxrandr2 \
    libasound2 \
    libpangocairo-1.0-0 \
    libatk1.0-0 \
    libcairo-gobject2 \
    libgtk-3-0 \
    libgdk-pixbuf-xlib-2.0-0 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxrender1 \
    libxtst6 \
    libxss1 \
    libnss3 \
    libnspr4 \
    libdrm2 \
    libxkbcommon0 \
    libatspi2.0-0 \
    libxrandr2 \
    libasound2 \
    libpangocairo-1.0-0 \
    libatk1.0-0 \
    ca-certificates \
    fonts-liberation \
    libappindicator3-1 \
    libnss3 \
    lsb-release \
    xdg-utils \
    nodejs \
    npm \
    bash \
    iproute2 \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY pdf-service/package*.json ./
RUN npm -g install pm2 && npm install --force
COPY pdf-service .
EXPOSE 8000
CMD ["pm2-runtime","start", "server.js"]
