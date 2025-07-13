FROM node:18-alpine AS build

WORKDIR /app

COPY . .

RUN npm install 
RUN npm run build --prod

FROM nginx:alpine

COPY --from=build /app/dist/kubernetes-testing/browser /usr/share/nginx/html

EXPOSE 80
CMD ["nginx","-g","daemon off;"]