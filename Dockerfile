FROM golang:alpine as builder
WORKDIR /work
COPY static /work/static
COPY main.go /work
RUN apk update && apk add --no-cache git && \
  go mod init github.com/Matts966/microsv && \
  go get github.com/gobuffalo/packr/v2/packr2 && \
  CGO_ENABLED=0 GOOS=linux GOARCH=386 packr2 build \
  -ldflags '-w -s'

FROM scratch
COPY --from=builder /work/microsv /main
EXPOSE 80
ENTRYPOINT [ "/main" ]
