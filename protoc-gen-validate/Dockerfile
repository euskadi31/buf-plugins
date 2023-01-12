# see: https://docs.buf.build/bsr/remote-generation/plugin-example

FROM golang:latest AS builder
RUN go install github.com/envoyproxy/protoc-gen-validate@v0.10.0-SNAPSHOT.3


FROM ubuntu:latest

# Runtime dependencies
LABEL "build.buf.plugins.runtime_library_versions.0.name"="github.com/euskadi31/buf-plugins/tree/main/protoc-gen-validate"
LABEL "build.buf.plugins.runtime_library_versions.0.version"="v0.10.0-SNAPSHOT.3"

COPY --from=builder /go/bin/protoc-gen-validate /protoc-gen-validate

ENTRYPOINT ["/protoc-gen-validate"]