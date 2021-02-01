# Use an existing docker image as a base
FROM node:alpine

# Download and install dependencies
WORKDIR /usr/app
COPY ./package.json /usr/app
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx
# Tell the image what to do when it starts as a container
COPY --from=0 /usr/app/build /usr/share/nginx/html