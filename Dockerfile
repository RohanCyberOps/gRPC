FROM golang:1.20-alpine AS builder
WORKDIR /app
COPY . .
RUN go build -o server

FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/server .
EXPOSE 50051
CMD ["./server"]
