FROM alpine:latest
RUN apk add tini cronie
WORKDIR /root
COPY cron-wrap run ./
ENV CRON_SCHEDULE "* * * * *"

ENTRYPOINT ["/sbin/tini", "-g", "--"]
CMD ["/root/run"]
