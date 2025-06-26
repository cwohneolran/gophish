FROM gophish/gophish:latest

# 1 Remove the cap_net_bind_service file capability that breaks in Render
RUN setcap -r /opt/gophish/gophish

# 2 Drop in your cloud-ready config
COPY config.json /opt/gophish/config.json

# 3 Expose the same ports (Render will proxy 80 → 443 for you)
EXPOSE 3333 80

# 4 Run the binary directly (it runs as root inside Render, so port 80 is fine)
CMD ["/opt/gophish/gophish", "-config", "/opt/gophish/config.json"]
