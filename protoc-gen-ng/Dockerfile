# see: https://docs.buf.build/bsr/remote-generation/plugin-example

FROM node:current-alpine

# Runtime dependencies
LABEL "build.buf.plugins.runtime_library_versions.0.name"="github.com/euskadi31/buf-plugins/tree/main/protoc-gen-ng"
LABEL "build.buf.plugins.runtime_library_versions.0.version"="v3.1.1"

WORKDIR /proto/

RUN npm install @ngx-grpc/protoc-gen-ng@3.1.1

ENTRYPOINT ["./node_modules/.bin/protoc-gen-ng"]
