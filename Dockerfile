FROM gophish/gophish:latest

# 1. Copy the binary to a new name – this strips the forbidden capabilities
RUN install -m 755 /opt/gophish/gophish /opt/gophish/gophish_clean

# 2. Overwrite with your Render-ready config
COPY config.json /opt/gophish/config.json

# 3. Expose non-privileged ports
EXPOSE 3333 8080

# 4. Run the clean binary on ports 3333 (admin) and 8080 (phish)
CMD ["/opt/gophish/gophish_clean", "-config", "/opt/gophish/config.json"]
