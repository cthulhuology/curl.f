
PACKAGE github

include curl.f

PRIVATE

: s+ ( s1 n1 s2 n2 -- s3 n3 )
third pad + swap dup >r move
pad swap dup >r move
pad r> r> + ;

: >> 2swap s+ ;

: eol over + 0 swap c! ;

create home-cache 1024 allot home-cache 1024 0 fill
$HOME zcount home-cache zplace s" /.forth/" home-cache zappend

: (github-raw) ( file repo user ) 
	s" https://raw.githubusercontent.com/" ( user ) >>
	s" /" s+
	( repo ) >> 
	s" /refs/heads/master/" s+
	( file ) >> eol ;

PUBLIC

: test s" curl.f" s" curl.f" s" cthulhuology" (github-raw) zcount type cr ;

: gitub bl word count 

END-PACKAGE
