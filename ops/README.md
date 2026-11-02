# mqqn.net

Plain HTML in `public/`, served by Firebase Hosting (site `mqqn-net` in project
`mqqn-net`). There is no build step. Scripts log to `ops/logs/` (git-ignored).

| `just` | Script | What it does |
|---|---|---|
| `just deploy` | `05-deploy.sh` | Deploys `public/`, then runs the check. |
| `just check` | `06-check.sh` | Read-only: this site's pages and every `*.mqqn.net` link in `public/`. |

Publishing is the `site` target in `.ship`, or `just deploy`. If the logins have
lapsed: `firebase login --reauth`.
