FROM alpine:latest
RUN apk add --no-cache curl
RUN mkdir /app
COPY fetch_metrics.sh /app/fetch_metrics.sh
RUN mkdir /metrics
WORKDIR /metrics
RUN chmod +x /app/fetch_metrics.sh
CMD ["/bin/sh", "/app/fetch_metrics.sh"]

