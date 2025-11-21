
PACKAGE github

include curl.f

PRIVATE

: s+ ( s1 n1 s2 n2 -- s3 n3 )
third pad + swap dup >r move
pad swap dup >r move
pad r> r> + ;

: >> 2swap s+ ;

: eol over + 0 swap c! ;

1024 buffer: home-cache
home-cache 1024 0 fill

: init-cache-dir
	$HOME zcount home-cache zplace s" /.forth/" home-cache zappend
	home-cache is-dir not if  s" mkdir -p ~/.forth" system then ;
init-cache-dir


: (github-raw) ( file repo user ) 
	s" https://raw.githubusercontent.com/" ( user ) zcount >>
	s" /" s+
	( repo ) zcount >> 
	s" /refs/heads/master/" s+
	( file ) zcount >> eol ;


0 value (github-path-segments)

: (github-path) ( "user/repo" | "user/repo/file" -- zfile zrepo zuser )
	0 to (github-path-segments)
	bl word count 
	cr 2dup type cr
	dup >r pad swap move 0 r@ pad + c!
	pad zcount type cr
	pad r> +
	begin dup pad > while
		.s cr
		dup zcount type cr
		dup 1- c@ [char] / = if
			dup 1- 0 over c! 		\ null the path segment
			1 +to (github-path-segments)	\ add a segment
		else 
			1- dup zcount type cr
		then
	.s cr
	repeat
	
	(github-path-segments) 2 < if
		dup
	then pad .s ;
	

PUBLIC

: test1 z" curl.f" z" curl.f" z" cthulhuology" (github-raw) zcount type cr ;

: github (github-path) (github-raw) zcount type cr ;

.s c

github cthulhuology/curl.f/curl.f 

END-PACKAGE
