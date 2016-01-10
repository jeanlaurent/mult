FROM node:argon

RUN mkdir -p /mult
WORKDIR /mult

COPY package.json /mult
RUN npm install

COPY . /mult

CMD "./start.sh"