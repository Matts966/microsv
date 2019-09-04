FROM golang:alpine as builder
RUN apk update && apk add --no-cache git
WORKDIR /work
RUN go mod init github.com/Matts966/microsv
RUN go get -u github.com/gobuffalo/packr/v2/packr2 && \
  go get -u github.com/gobuffalo/packr/v2/...
COPY static /work
COPY main.go /work
RUN packr2 build && \
  CGO_ENABLED=0 GOOS=linux GOARCH=386 go build \
  -ldflags '-extldflags "-static" -w -s' -o main .

FROM scratch
COPY --from=builder /work/main /main
EXPOSE 80
ENTRYPOINT [ "/main" ]
