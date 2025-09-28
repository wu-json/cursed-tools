version := `cat VERSION`

bump-and-commit-version bump_type:
  #!/usr/bin/env bash
  new_version=$(svu {{bump_type}})
  echo $new_version > VERSION
  git add -A
  git commit -m "chore(release): v$new_version"
  git tag v$new_version
  git push --follow-tags

release:
  gh release create v{{version}} --generate-notes
