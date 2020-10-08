# zip folder (-0 to not compress):
folder=folder
zip -0 -r $folder.zip $folder

# unzip
unzip $folder.zip

# break into 500MB parts
zip $folder.zip --out $folder-parts.zip -s 500m

# merge parts into single zip
zip -F $folder-parts.zip --out $folder-merged.zip
unzip $folder-merged.zip
