# Discard without save (git add not run)

## Discard all local changes to all files permanently
git reset --hard

## Remove untracked files/dirs
If you want to see which files will be deleted you can use the -n option before you run the actual command:
git clean -n
Then when you are comfortable (because it will delete the files for real!) use the -f option:
git clean -f
Here are some more options for you to delete directories, files, ignored and non-ignored files
To remove directories, run                   git clean -f -d or git clean -fd
To remove ignored files, run                 git clean -f -X or git clean -fX
To remove ignored and non-ignored files, run git clean -f -x or git clean -fx






## Discarding local changes (permanently) to one file
git checkout -- file_path


# Discard all local changes, but save them for possible re-use later:
git stash
