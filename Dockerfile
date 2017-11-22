FROM openshift/base-centos7

MAINTAINER Oliver Weise <oliver.weise@consol.de>

LABEL io.k8s.description="An NGINX builder image" \
    io.k8s.display-name="NGINX Builder Image" \
    io.openshift.s2i.scripts-url="image:///usr/libexec/s2i" \
    io.openshift.tags="builder,nginx" \
    io.openshift.expose-services="8080:http"

RUN yum install -y epel-release && \
    yum makecache fast

RUN INSTALL_PKGS="tar unzip nginx" && \
    yum install -y $INSTALL_PKGS && \
    yum clean all && \
    rm -rf /var/cache/yum

COPY s2i /usr/libexec/s2i/
COPY ./nginx.conf /etc/nginx/nginx.conf

USER 1001

EXPOSE 8080

CMD ["/usr/libexec/s2i/usage"]
