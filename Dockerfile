FROM gophish/gophish:latest

# copy a clean binary (no capabilities)
RUN install -m 755 /opt/gophish/gophish /opt/gophish/gophish_clean

# overwrite with your config (ports 3333, 8080)
COPY config.json /opt/gophish/config.json

EXPOSE 3333 8080

# >>> replace -config with --config  <<<
CMD ["/opt/gophish/gophish_clean", "--config", "/opt/gophish/config.json"]

