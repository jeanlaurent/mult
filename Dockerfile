FROM node:7.5-alpine
LABEL maintainer jeanlaurent@morlhon.net

RUN mkdir /mult
WORKDIR /mult

COPY package.json /mult
RUN npm install

COPY . /mult

# calling npm start here generates a bunch of header lines
# going through a script eat thoses header lines.
CMD [ "./start.sh" ]
