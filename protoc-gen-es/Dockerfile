# see: https://docs.buf.build/bsr/remote-generation/plugin-example

FROM node:current-alpine

# Runtime dependencies
LABEL "build.buf.plugins.runtime_library_versions.0.name"="github.com/euskadi31/buf-plugins/tree/main/protoc-gen-es"
LABEL "build.buf.plugins.runtime_library_versions.0.version"="v1.0.0"

WORKDIR /proto/

RUN npm install @bufbuild/protobuf @bufbuild/protoc-gen-es@1.0.0

ENTRYPOINT ["./node_modules/.bin/protoc-gen-es"]
