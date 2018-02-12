FROM node:9.5-alpine
LABEL maintainer jeanlaurent@morlhon.net

WORKDIR /mult

COPY package.json /mult
RUN npm install

COPY . /mult

# calling npm start here generates a bunch of header lines
# going through a script eat thoses header lines.
CMD [ "./start.sh" ]
