include curl.f
0 value client
curl_easy_init to client
client CURLOPT_URL z" https://dloh.org" curl_easy_setopt drop
client curl_easy_perform 0<> ABORT" Failed to fetch website "
bye
