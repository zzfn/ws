FROM node:lts-alpine
WORKDIR /app

ENV TZ="Asia/Shanghai"
ENV NODE_ENV=production
RUN corepack enable
RUN corepack prepare pnpm@latest --activate
RUN pnpm i --frozen-lockfile
COPY app.js ./

EXPOSE 3000

ENV PORT 3000

CMD ["node", "app.js"]
