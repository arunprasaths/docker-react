# builder phase - using as <phase name>
FROM node:16-alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
CMD npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html


