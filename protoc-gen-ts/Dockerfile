# see: https://docs.buf.build/bsr/remote-generation/plugin-example

FROM node:current-alpine

# Runtime dependencies
LABEL "build.buf.plugins.runtime_library_versions.0.name"="github.com/euskadi31/docker-protoc-gen-ts"
LABEL "build.buf.plugins.runtime_library_versions.0.version"="vv0.15.0"

WORKDIR /proto/

RUN npm install ts-protoc-gen@v0.15.0

ENTRYPOINT ["./node_modules/.bin/protoc-gen-ts"]
