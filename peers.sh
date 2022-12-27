address=$(ip route | grep default | awk {'print $3'})

network="$address/24"

echo "Running Scan for netword: $network"
sudo nmap -v -A -T5 $network
