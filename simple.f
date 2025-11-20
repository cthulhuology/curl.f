include curl.f
0 value client
curl_easy_init to client
client 0= ABORT" failed to initialize curl"
client CURLOPT_URL s" https://dloh.org/index.html" drop curl_easy_setopt drop
client curl_easy_perform 0<> ABORT" Failed to fetch simple webpage"
bye
