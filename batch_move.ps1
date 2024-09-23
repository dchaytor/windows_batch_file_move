# being kind of lazy here, might be nice if this program listed files in current directory before prompting for output dir
# should probably be checking inputs better, also just generally not very well tested - use at own risk
# ngl wanted to minimize how much PS i had to look up here
param (
	[STRING]$SOURCE_DIR=( GET-LOCATION ) ,
	[STRING]$TARGET_DIR=( READ-HOST "Specify target directory" ),
	[STRING]$F_LIST=( READ-HOST "Specify file list" )
)

# check input parameters - i.e., check to make sure source directory, target directory and file list exist
IF (-NOT( TEST-PATH -PATH $SOURCE_DIR ))	{
	WRITE-HOST "ERROR: source directory could not be found"
	EXIT
}

IF (-NOT( (TEST-PATH -PATH $F_LIST) -OR ([IO.Path]::GETEXTENSION($F -EQ '.txt'))))	{
	WRITE-HOST "ERROR: list of files to move could not be found, or file was not in proper (.txt) format"
	EXIT
}

IF (-NOT( TEST-PATH -PATH $TARGET_DIR ))	{	
	NEW-ITEM $TARGET_DIR -ITEMTYPE "directory"		
}

# i'm assuming the file is relatively small here - again, should prob be checking inputs better here
$FLIST_CONTENT = GET-CONTENT -PATH $F_LIST
WRITE-HOST "FILES MOVED:"
FOREACH ( $LINE in $FLIST_CONTENT )	{
	IF (-NOT($LINE -EQ ""))	{
		[STRING]$MV_FILE = $SOURCE_DIR + "\" + $LINE

		IF ( TEST-PATH -PATH $MV_FILE)	{
			WRITE-HOST " "  $LINE
			MOVE-ITEM $MV_FILE $TARGET_DIR
		}
	}
}

WRITE-HOST "0"