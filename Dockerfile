FROM rancher/os-alpineconsole:v1.5.2-rc1
ARG VERSION
ARG VCS_REF
ARG BUILD_DATE
LABEL org.label-schema.schema-version="1.0" \
      org.label-schema.name="ansible-console" \
      org.label-schema.version="$VERSION" \
      org.label-schema.license="MIT" \
      org.label-schema.maintainer="https://github.com/capybara1/" \
      org.label-schema.url="https://github.com/capybara1/Docker-AnsibleConsole" \
      org.label-schema.vcs-url="https://github.com/capybara1/Docker-AnsibleConsole" \
      org.label-schema.vcs-ref="$VCS_REF" \
      org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.dockerfile="/Dockerfile"
COPY motd /etc/motd
RUN apk add --no-cache attr python3 py3-pip \
 && apk add --no-cache --virtual .build-deps gcc make musl-dev python3-dev libffi-dev openssl-dev py3-paramiko py3-cffi \
 && pip3 install docker-compose \
 && apk del .build-deps \
 && pip3 install "six<2" "idna<2.8" "PyYAML<4.3" pymysql jmespath pexpect
COPY Z99-customizations.sh /etc/profile.d/
ENTRYPOINT ["/usr/bin/ros", "entrypoint"]
