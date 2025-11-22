include curl

: (write-callback) ( a i i a -- i )
	_param_3 _param_0 _param_1 _param_2 * write ;
	

' (write-callback) 0 CALLBACK: write_cb

0 value client
1 value fd		\ write to stdout if filename not supplied
: download ( url -- )
	curl_easy_init to client
	client CURLOPT_URL rot curl_easy_setopt
	client CURLOPT_VERBOSE 0 curl_easy_setopt
	client CURLOPT_NOPROGRESS 1 curl_easy_setopt
	client CURLOPT_WRITEFUNCTION write_cb curl_easy_setopt
	client CURLOPT_WRITEDATA fd curl_easy_setopt		\ to _param_3
	client curl_easy_perform drop
	client curl_easy_cleanup ;	

: main 
	argc 2 < if 
		." usage: download url [filename]"  cr bye then
	argc 2 > if 
		." writing to " 2 argv type cr
		2 argv r/w create-file throw to fd
	then
	1 argv drop download 
	fd close-file ;

starter main
program download
bye	
