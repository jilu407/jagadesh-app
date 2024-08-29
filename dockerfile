FROM node:20.17.0-slim AS jack
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build 
RUN ls dist/

FROM nginx
COPY --from=jack  /app/dist/jagadesh-app/browser /usr/share/nginx/html/

