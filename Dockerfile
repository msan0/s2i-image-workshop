FROM openshift/base-centos7

MAINTAINER Oliver Weise <oliver.weise@consol.de>

LABEL io.k8s.description="An NGINX builder image" \
    io.k8s.display-name="NGINX Builder Image" \
    io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"

RUN INSTALL_PKGS="tar unzip nginx" && \
    yum install -y $INSTALL_PKGS && \
    yum clean all && \
    rm -rf /var/cache/yum

COPY s2i /usr/libexec/s2i/

USER 1001

CMD ["sh", "-c", "/usr/libexec/s2i/usage"]
ENTRYPOINT ["sh", "-c"]