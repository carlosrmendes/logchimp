FROM node:16-buster

ENV LOGCHIMP=1

WORKDIR /logchimp
COPY ./ /logchimp

RUN yarn install
RUN cd ./packages/theme && \
    yarn install && \
    yarn build

EXPOSE 3000
CMD [ "node", "index.js" ]
