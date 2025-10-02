# Caddy with L4 Addon

This repository provides a Docker image of [Caddy](https://caddyserver.com/) with the [L4 addon](https://github.com/mholt/caddy-l4) pre-installed.

The image also bundles the [`acmedns`](https://github.com/caddy-dns/acmedns) and [`he`](https://github.com/caddy-dns/he) DNS modules so you can solve ACME challenges with either provider out of the box.

## Usage

You can pull the image from GitHub Container Registry:

```bash
docker pull ghcr.io/hedger/caddy-with-l4:latest
```

Recent versioned tags are also available—images are rebuilt whenever upstream ships a new release:

```bash
# pin to the most recent upstream Caddy tag
docker pull ghcr.io/hedger/caddy-with-l4:2.10.2
```

## Features

- Caddy web server with L4 TCP/UDP proxy capabilities
- Customizable Caddy version through the `CADDY_VERSION` build argument
- Automated release detection and rebuilds for new upstream Caddy versions
- CI-powered Docker build, publish, and smoke test workflows
- Published GHCR packages tracking the latest stable Caddy releases
- Included DNS providers: `acmedns` and `he`

## Automation

| Workflow | Schedule / Trigger | Purpose |
| --- | --- | --- |
| `check-caddy-version.yml` | Weekly (Mon 00:00 UTC) or manual | Fetches the latest upstream Caddy release, checks GHCR for an existing image tag, and triggers a rebuild only when needed. |
| `docker-build-publish.yml` | Pushes to `main`, tags `v*`, manual dispatch, or reusable call | Builds the image, applies standard tags (`latest`, ref-based, and the requested version), and publishes to GHCR when not on a pull request. |
| `test-docker-build.yml` | Pull requests touching the Dockerfile or build workflow | Builds the image matrix (`2`, `2.7.4`) without pushing and verifies the binary responds with `caddy version` and exposes the L4 module. |

## Building Locally

```bash
docker build --build-arg CADDY_VERSION=2.7.4 -t caddy-with-l4:2.7.4 .
```

## License

This project is provided under the same license as Caddy.