# Merge your fix-or-feature-branch to develop (or master), checkout develop, add tag:
git tag -a v1.0 -m "comment"


git tag module-v5.5.5
git push --tags






# Rename tag:
git tag new old   # alias
git tag -d old    # delete old locally
git remote -v                  # to see names of remotes ("origin" usually)
git push origin :refs/tags/old # to remove old remotely
git push origin --tags
