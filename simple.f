include curl.f

0 value client

: get-dloh.org
	curl_easy_init to client
	client CURLOPT_URL z" https://dloh.org" curl_easy_setopt drop
	client curl_easy_perform ?dup if
		curl_easy_strerror zcount type 
	then
	client curl_easy_cleanup ;

get-dloh.org
bye
