# 1. Use a fixed LTS, minimal image
FROM node:lts-alpine

# 2. Create app directory as root, then chown it
RUN mkdir -p /home/node/app \
    && chown -R node:node /home/node/app

# 3. Switch to non-root node user
USER node

# 4. Set working directory
WORKDIR /home/node/app

# 5. Copy package files and install deps
COPY --chown=node:node package*.json ./
RUN npm ci --only=production

# 6. Copy app source, preserving ownership
COPY --chown=node:node . .

# 7. Prod settings and entrypoint
ENV NODE_ENV=production
EXPOSE 3000
CMD ["node", "index.js"]
