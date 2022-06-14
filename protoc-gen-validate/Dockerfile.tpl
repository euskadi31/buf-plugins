# see: https://docs.buf.build/bsr/remote-generation/plugin-example

FROM golang:latest AS builder
RUN go install github.com/envoyproxy/protoc-gen-validate@v{{.Version}}


FROM ubuntu:latest

# Runtime dependencies
LABEL "build.buf.plugins.runtime_library_versions.0.name"="github.com/euskadi31/buf-plugins/tree/main/protoc-gen-validate"
LABEL "build.buf.plugins.runtime_library_versions.0.version"="v{{.Version}}"

COPY --from=builder /go/bin/protoc-gen-validate /protoc-gen-validate

ENTRYPOINT ["/protoc-gen-validate"]