# traefik-k8s-http3-example
This repository demonstrates the use of the Traefik `advertisedPort` option for HTTP3.

Build Traefik image: `make build-image` (from PR https://github.com/traefik/traefik/pull/8131)

Run the cluster with: `make start`

Optionally, check the dashboard at: http://127.0.0.1:8080/dashboard/#/

When everything is running, execute: `curl --http3 -vvv -H "Host: whoami" https://127.0.0.1` (needs a curl build with http3, for instance see https://developers.cloudflare.com/http3/curl-brew)