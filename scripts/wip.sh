#!/bin/sh
#
# Add * -> commit "wip" -> rebase if needed -> push force origin -> flux reconcile reconcile

git add .

git commit -m "wip"

PREVIOUS_COMMIT=$(git log -2 --pretty=format:%s | tail -n 1)

if [ "$PREVIOUS_COMMIT" = "wip" ]; then
  # Set GIT_SEQUENCE_EDITOR to change the second 'pick' to 's' (squash)
  export GIT_SEQUENCE_EDITOR="sed -i '2s/pick/squash/'"

  # Set GIT_EDITOR to overwrite the commit message with "wip"
  export GIT_EDITOR="echo wip >"

  # Perform the non-interractive rebase
  git rebase -i HEAD~2

  unset GIT_SEQUENCE_EDITOR
  unset GIT_EDITOR
fi

git push origin +HEAD
