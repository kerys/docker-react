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
COPY --from=builder /app/build /usr/share/nginx/html



