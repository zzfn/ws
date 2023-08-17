FROM node:lts-alpine
WORKDIR /app

ENV TZ="Asia/Shanghai"
ENV NODE_ENV=production
COPY app.js ./
COPY package.json ./
COPY pnpm-lock.yaml ./

RUN corepack enable
RUN corepack prepare pnpm@latest --activate
RUN pnpm i --frozen-lockfile


EXPOSE 3000

ENV PORT 3000

CMD ["node", "app.js"]
