# show branches
  git branch       # local
  git branch -r    # remote
  git branch -a    # all

# create and switch to new local branch
 git checkout -b ver100


# push the local branch
 .. add
 .. commit
 git push --set-upstream origin feature/MERA-2180-uus-to-use-db-instead-of-xml-file-on-vnism





# remove local branch
  git branch        --delete branch_name
# remove remote branch
  git push origin   --delete branch_name    # here, origin is remote_name
