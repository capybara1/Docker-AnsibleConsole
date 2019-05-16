FROM rancher/os-alpineconsole:v1.5.2-rc1 
RUN apk --no-cache add python
ENTRYPOINT ["/usr/bin/ros", "entrypoint"]