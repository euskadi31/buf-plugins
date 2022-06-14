# see: https://docs.buf.build/bsr/remote-generation/plugin-example

FROM ubuntu:latest AS builder
ADD https://jpa.kapsi.fi/nanopb/download/nanopb-{{.Version}}-linux-x86.tar.gz /
RUN tar -zxvf nanopb-{{.Version}}-linux-x86.tar.gz
RUN mv nanopb-{{.Version}}-linux-x86 nanopb-linux-x86

FROM ubuntu:latest

# Runtime dependencies
LABEL "build.buf.plugins.runtime_library_versions.0.name"="github.com/euskadi31/buf-plugins/tree/main/protoc-gen-nanopb"
LABEL "build.buf.plugins.runtime_library_versions.0.version"="v{{.Version}}"

COPY --from=builder /nanopb-linux-x86/generator-bin/ /nanopb

ENTRYPOINT ["/nanopb/protoc-gen-nanopb"]
