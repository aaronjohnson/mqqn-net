# mqqn.net (Firebase Hosting site mqqn-net). Steps in ops/; see ops/README.md.
default:
    @just --list

# preview public/ at http://127.0.0.1:8765 (Ctrl+C to stop)
preview:
    cd public && python3 -m http.server 8765 --bind 127.0.0.1

# deploy, then check the links
deploy:
    ops/05-deploy.sh

# read-only check of the pages and links
check:
    ops/06-check.sh
