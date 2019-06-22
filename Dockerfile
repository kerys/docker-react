 # PHASE I
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
# installs dependencies
RUN npm install
# copy actual application
COPY . .
# creates build folder in /app/build
RUN npm run build

# PHASE II
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html



