# CodeSandbox Devcontainer feature

CodeSandbox devcotnainer feature enables the dev experience available in the CodeSandbox cloud sandboxes and repos. This add a bunch of tools required for a good experience
- Docker client cli
- git
- curl and wget
- ZSH and OhMyZSH
- other essential cli tools

This can be installed by adding `ghcr.io/codesandbox/devcontainer-features/codesandbox:latest` to `features` field in `devcontainer.json`
```
"features": {
     "ghcr.io/codesandbox/devcontainer-features/codesandbox:latest": {},
}
```