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
RUN apk --no-cache add attr python py-pip \
 && pip install pyyaml pymysql jmespath pexpect
COPY Z99-customizations.sh /etc/profile.d/
ENTRYPOINT ["/usr/bin/ros", "entrypoint"]