# Use the official, pre-built binary image
FROM gophish/gophish:latest

# Overwrite with your Render-ready config
COPY config.json /opt/gophish/config.json

# Expose the two ports we actually use
EXPOSE 3333 8080

# Run the binary directly (no run.sh, no capabilities needed)
CMD ["/opt/gophish/gophish", "-config", "/opt/gophish/config.json"]
