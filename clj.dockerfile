FROM clojure:lein-alpine

WORKDIR /app
COPY ./example-clj .

RUN lein deps

COPY ./*.txt .
RUN mv "$(lein uberjar | sed -n 's/^Created \(.*standalone\.jar\)/\1/p')" app-standalone.jar
ENTRYPOINT [ "java", "-jar", "app-standalone.jar" ]
