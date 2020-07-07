#https://www.atlassian.com/git/tutorials/rewriting-history/git-rebase
git rebase origin/tobranch
git rebase tobranch
git rebase tobranch -i
git rebase --abort



>git rebase develop -i
fatal: It seems that there is already a rebase-apply directory, and
I wonder if you are in the middle of another rebase.  If that is the
case, please try
        git rebase (--continue | --abort | --skip)
If that is not the case, please
        rm -fr ".git/rebase-apply"
and run me again.  I am stopping in case you still have something
valuable there.


