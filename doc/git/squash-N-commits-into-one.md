#https://www.internalpointers.com/post/squash-commits-into-one-git

## interactive ==> will call $EDITOR $VISUAL
#EDITOR=mcedit
#EDITOR=code
#VISUAL=code
#git rebase --interactive HEAD~3  ## to squash 3 commits into one


#1) in vi, mark which commits are picked, which squashed (replace pick by s). Note commits are in reverse order.
#2) in vi, edit commit message
#git push



### Squash $N already published commits in branch $BR:
EDITOR=mcedit
N=2
BR=br/name

git rebase --interactive origin/$BR~$N $BR
git push origin +$BR
