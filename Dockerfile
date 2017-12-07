FROM registry.access.redhat.com/rhel7.4

MAINTAINER Oliver Weise <oliver.weise@consol.de>

LABEL io.k8s.description="An NGINX builder image" \
    io.k8s.display-name="NGINX Builder Image" \
    io.openshift.s2i.scripts-url="image:///usr/libexec/s2i" \
    io.openshift.tags="builder,nginx" \
    io.openshift.expose-services="8080:http"

RUN INSTALL_PKGS="tar unzip httpd" && \
    yum install -y $INSTALL_PKGS && \
    yum clean all && \
    rm -rf /var/cache/yum

COPY s2i /usr/libexec/s2i/

USER 1001

EXPOSE 8080

CMD ["/usr/libexec/s2i/usage"]
