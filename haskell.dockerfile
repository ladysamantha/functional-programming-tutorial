FROM fpco/stack-build:latest

WORKDIR /app
COPY ./example-haskell .

# https://github.com/commercialhaskell/stack/issues/3686
# Since my stack is targeting a new LTS resolver
RUN stack upgrade

# RUN stack setup
RUN stack build --only-dependencies

COPY ./leaves.txt .

RUN stack install

ENTRYPOINT [ "example-haskell-exe" ]
