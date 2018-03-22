FROM node:9-alpine

WORKDIR /app

COPY ./src/*.js ./
COPY ./*.txt ./
COPY ./src/run.sh ./

RUN chmod +x run.sh

ENTRYPOINT [ "./run.sh" ]
