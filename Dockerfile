FROM node:7.5-alpine

run mkdir /mult
WORKDIR /mult

COPY package.json /mult
RUN npm install

COPY . /mult

# calling npm start here generates a bunch of header lines
CMD [ "./start.sh" ]
