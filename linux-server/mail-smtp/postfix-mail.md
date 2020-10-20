# install Postfix
# sudo apt install -y mailutils

## Print all email to STDOUT:

$ echo "type *" | mail

$ echo "type 1" | mail   # print the first email to stdout

$ echo "type 3-5" | mail # print the emails from 3 to 5

## Check if mail box is empty (i.e. "No mail for [username]" is found):

$ echo q | mail 2>&1 | grep "No mail for [username]"

## Purge the mail box:

$ echo "d *" | mail

$ echo "d 3" | mail     # Delete the 3rd email

## Save all emails in a text file:

$ echo "s * test.txt" | mail

## Save emails between a range in a file:

$ echo "s 3-6 test.txt" | mail # this will save email from #3 to #6 to the file test.txt

## Read one email from mailbox:

$ echo 1 | mail # Read the first mail from mail box:

$ echo 5 | mail # Read the 5th email from mail box: 

$ echo 6 | mail

If there is no 6th mail from mail box. It will prompt you below error:

6: Invalid message number

The error message "Invalid message number" tells you that there is no 6th email in the mailbox.
If the 5th email is successfully returned. You can treat the error message "Invalid message number"
as end of mailbox just like the EOF of a file. Combined this with a loop, you can browse thru all
the emails inside the mailbox.
