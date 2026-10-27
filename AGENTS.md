# AGENTS.md

## When a task is done

```
make format
make lint
make test
```

`make format` runs `ruff-format` and `isort-format`. `make lint` runs `ruff-check`, `isort-check`, and `mypy`, in that order. `make test` runs pytest.

If lint or tests fail, fix it and run those three again.

Then run `/deslop` and `/review-bugbot`. If either finds a problem, fix it and start over from `make format`. Stop when neither finds anything.

## uv

Install dependencies and run commands only through uv.

- Dependency: `uv add <package>`
- Dev dependency: `uv add --dev <package>`
- Run: `uv run <command>`

## Git

- Do not push to `main` unless explicitly asked.
- A force push is always `git push --force-with-lease`. Never `git push --force`.
