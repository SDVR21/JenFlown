FROM node:16 as builder
ENV NODE_ENV="production"

COPY . /app
WORKDIR /app
RUN npm install

FROM node:16
ENV NODE_ENV="production"
COPY --from=builder /app /app
WORKDIR /app
ENV PORT 80
EXPOSE 80
CMD ["node", "app.js"]
