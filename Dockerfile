FROM rancher/os-alpineconsole:v1.5.2-rc1
ARG VCS_REF
ARG BUILD_DATE
LABEL org.label-schema.schema-version="1.0" \
      org.label-schema.name="ansible-console" \
      org.label-schema.version="1.0.$VCS_REF" \
      org.label-schema.license="MIT" \
      org.label-schema.maintainer="https://github.com/capybara1/" \
      org.label-schema.url="https://github.com/capybara1/Docker-AnsibleConsole" \
      org.label-schema.vcs-url="https://github.com/capybara1/Docker-AnsibleConsole" \
      org.label-schema.vcs-ref="$VCS_REF" \
      org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.dockerfile="/Dockerfile"
RUN apk --no-cache add python py-pip \
 && pip install pyyaml
ENTRYPOINT ["/usr/bin/ros", "entrypoint"]