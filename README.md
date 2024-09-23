# windows_batch_file_move
Script to move a bunch of files from one directory to another (possibly new) directory based on a .txt file

PITA to go through large  batches of photos and move select photos to another directory (e.g., when sorting through
vacation photos and looking to move the best ones into another dir)
-> have to open photos, decide whether it's a good pic, then find file in directory and drag over to new folder
-> especially annoying because filenames are typically not descriptive, so easy to grab wrong one
-> additionally, folder is at top of current dir (can pin to quick access, but still annoying)
want something where i can just open a photo, record name in a text file, then batch move after going thru everything
file extension must be written explicitly in file to prevent duplicate filenames with different extensions

script should take in a source directory (if none provided, default to current directory), a target directory, and 
a list of files to move (stored as a plain text doc, with each file on a different line), then moves files in source
to target if they exist (should skip over file if it doesn't exist, not throw error and stop)
