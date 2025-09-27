# Caddy with L4 Addon

This repository provides a Docker image of [Caddy](https://caddyserver.com/) with the [L4 addon](https://github.com/mholt/caddy-l4) pre-installed.

## Usage

You can pull the image from GitHub Container Registry:

```bash
docker pull ghcr.io/hedger/caddy-with-l4:latest
```

## Features

- Caddy web server with L4 TCP/UDP proxy capabilities
- Customizable Caddy version through build arguments
- GitHub Actions workflow for automated building and publishing

## GitHub Workflows

### Build and Publish Workflow

The repository includes a GitHub workflow that:

1. Builds the Docker image on push to main branch
2. Builds on pull requests (without publishing)
3. Publishes to GitHub Container Registry when merged to main
4. Creates versioned tags when GitHub releases are created
5. Allows manual builds with custom Caddy versions

## Building Locally

To build the Docker image locally with a specific Caddy version:

```bash
docker build --build-arg CADDY_VERSION=2.7.4 -t caddy-with-l4:2.7.4 .
```

## License

This project is provided under the same license as Caddy.