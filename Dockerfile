FROM golang:latest as builder
WORKDIR /go/src/github.com/percona/rds_exporter
RUN git clone --progress --verbose https://github.com/percona/rds_exporter.git .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o rds_exporter .

FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /
COPY --from=builder /go/src/github.com/percona/rds_exporter/rds_exporter .
ENTRYPOINT ["./rds_exporter", "--config.file=/rds-exporter-config/config.yml"]
