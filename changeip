#!/bin/bash
printf "\n"

echo "IPs de saída atuais:"

printf "\n"

privoxy=$(wget --no-cache --no-cookies -qO- https://icanhazip.com --post-data="action=purge")
privoxy_country=$(geoiplookup $privoxy | awk -F "," '{print $2}')
socks5=$(curl -sx socks5://localhost:9050 icanhazip.com)
socks5_country=$(geoiplookup $socks5 | awk -F "," '{print $2}')

sleep 2

echo "Privoxy (Tor) IP:" $privoxy "("$privoxy_country")"
printf "\n"
echo "Socks5 (Tor) IP:" $socks5 "("$socks5_country")"
printf "\n"

echo "Renovando IPs de saída..."

docker_id=$(docker ps | grep torproxy | awk '{print $1}')
docker restart $docker_id

printf "\n"
echo "Novos Ips de saída"

privoxy=$(wget --no-cache --no-cookies -qO- https://icanhazip.com --post-data="action=purge")
privoxy_country=$(geoiplookup $privoxy | awk -F "," '{print $2}')
socks5=$(curl -sx socks5://localhost:9050 icanhazip.com)
socks5_country=$(geoiplookup $socks5 | awk -F "," '{print $2}')

printf "\n"
echo "Privoxy (Tor) IP:" $privoxy "("$privoxy_country")"
printf "\n"
echo "Socks5 (Tor) IP:" $socks5 "("$socks5_country")"
printf "\n"

sleep 3

exit