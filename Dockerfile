FROM node:19-alpine3.15

WORKDIR /reddit-clone

COPY . /reddit-clone
RUN npm install 

EXPOSE 8000
CMD ["npm","run","dev"]
