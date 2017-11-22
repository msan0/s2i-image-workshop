FROM openshift/httpd
RUN pwd
RUN ls -l
RUN ls -l /tmp
RUN mkdir -p /opt/rh/httpd24/root/var/www/html
COPY website/index.html /opt/rh/httpd24/root/var/www/html
COPY website/styles.css /opt/rh/httpd24/root/var/www/html