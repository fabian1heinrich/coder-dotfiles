# Coder dotfiles

Minimal personal shell configuration for air-gapped Coder workspaces.

The repository intentionally configures preferences only. Runtime tools,
packages, extensions, credentials, and Git identity belong to the workspace
image or template.

Coder's dotfiles support runs `install.sh` automatically. The installer is
idempotent, performs no network access, and preserves an existing `.zshrc`.

The eventual GitHub remote will live under `fabian1heinrich`; the repository
name can be changed before creating that remote.
