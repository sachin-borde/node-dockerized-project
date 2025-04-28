# 1. Use a stable, minimal image
FROM node:lts-alpine

# 2. Create & switch to a non-root user
#    Official Node images include a 'node' user
USER node

# 3. Set working directory
WORKDIR /home/node/app

# 4. Copy only package manifests & install dependencies
COPY --chown=node:node package*.json ./
RUN npm ci --only=production

# 5. Copy app source
COPY --chown=node:node . .

# 6. Expose port and set environment
ENV NODE_ENV=production
EXPOSE 3000

# 7. Run as non-root
CMD ["node", "index.js"]
