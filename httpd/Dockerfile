FROM alpine:latest
RUN apk add --no-cache tini busybox-extras
RUN mkdir -p /var/www/html
RUN echo '<h1>Hello, world!</h1>' > /var/www/html/index.html
ENTRYPOINT ["/sbin/tini", "-g", "--"]
RUN touch /etc/httpd.conf
CMD [ "httpd", "-f", "-h", "/var/www/html", "-p", "80", "-c", "/etc/httpd.conf" ]
