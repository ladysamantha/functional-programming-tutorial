FROM node:9-alpine

WORKDIR /app

COPY ./example-js/* ./
COPY ./*.txt ./

RUN chmod +x run.sh

ENTRYPOINT [ "./run.sh" ]
