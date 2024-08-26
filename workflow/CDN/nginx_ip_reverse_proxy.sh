!/bin/bash
# Reveal real IP for Nginx behind a reverse proxy | inDev. Journal
# https://frankindev.com/2020/12/25/nginx-real-ip-behind-reverse-proxy/

set -e

cf_ips() {
  echo "# https://www.cloudflare.com/ips"

  for type in v4 v6; do
    echo "# IP$type"
    curl -s "https://www.cloudflare.com/ips-$type/" | sed "s|^|set_real_ip_from |g" | sed "s|\$|;|g"
    echo
  done
  echo "real_ip_header CF-Connecting-IP;"
  echo "# Generated at $(LC_ALL=C date)"
}

#cf_ips > /etc/nginx/cloudflare-ips.conf
cf_ips
#sudo systemctl reload nginx
# Then, you can include the generated /etc/nginx/cloudflare-ips.conf file in your virtual domain configuration file where required:
# include /etc/nginx/cloudflare-ips.conf;

# Wipe out all existing rules
#  /sbin/iptables -t nat -F
# lxd forward
# apt install iptables
  /sbin/iptables -t nat -A PREROUTING -p tcp --dport 443 -j DNAT --to instance.ip:443
# How can I forward the HTTP and SSH port to my internal server using iptables? - Server Fault
# https://serverfault.com/questions/564445/how-can-i-forward-the-http-and-ssh-port-to-my-internal-server-using-iptables