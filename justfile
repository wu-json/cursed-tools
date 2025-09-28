tag version:
  #!/usr/bin/env bash
  if ! git rev-parse "v{{version}}" >/dev/null 2>&1; then
    git tag v{{version}}
    git push origin v{{version}}
  else
    echo "Tag v{{version}} already exists, skipping..."
  fi

release version:
  just tag version
  git push --tags
  gh release create v{{version}} --generate-notes
