FROM rancher/os-alpineconsole:v1.5.2-rc1
LABEL version="1.0"
RUN apk --no-cache add python
ENTRYPOINT ["/usr/bin/ros", "entrypoint"]