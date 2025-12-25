FROM ghcr.io/sparfenyuk/mcp-proxy:latest

USER root

# Install bash to support the entrypoint script
RUN if command -v apk > /dev/null; then \
        apk add --no-cache bash; \
    elif command -v apt-get > /dev/null; then \
        apt-get update && apt-get install -y bash; \
    fi

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

