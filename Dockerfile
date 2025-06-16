FROM nginx:alpine

RUN apk --no-cache update && apk --no-cache upgrade && apk add --no-cache ca-certificates tzdata curl

COPY nginx.conf /etc/nginx/nginx.conf

COPY --chown=nginx:nginx dist /www/site

COPY docker_cmd.sh /
COPY refresh_config.sh /
RUN chmod +x /docker_cmd.sh /refresh_config.sh

HEALTHCHECK --start-period=4s --interval=10s --timeout=2s --retries=3 CMD curl -f http://localhost || false

CMD ["/docker_cmd.sh"]