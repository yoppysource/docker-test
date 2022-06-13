FROM node:16-alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#/app/build : this is only our concern
#FROM때문에 전블락이 끝난 걸 암
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# 자동으로 실행될꺼임