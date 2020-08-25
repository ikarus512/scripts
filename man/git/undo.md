https://docs.gitlab.com/ee/topics/git/numerous_undo_possibilities_in_git



1) Before git add
1.1) recover deleted file(-s)
    git checkout .
    git checkout -- filename




2) undo last commit (not removing changes) and you can see diff for the last commit
    git reset HEAD~
