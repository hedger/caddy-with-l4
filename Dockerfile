# Accept build argument for Caddy version with fallback to '2'
ARG CADDY_VERSION=2

# Stage 1: Build the Caddy binary with xcaddy
FROM caddy:${CADDY_VERSION}-builder AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-l4

# Stage 2: Create the final Caddy image
FROM caddy:${CADDY_VERSION}-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile", "--watch"]
