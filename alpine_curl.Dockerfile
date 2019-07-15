FROM arm64v8/alpine:latest

RUN apk add --no-cache curl

ENTRYPOINT ["/usr/bin/curl"]