ROOT=${2:-$PWD}
SITE=${1:-$(basename $PWD)}

echo "
# $SITE
<VirtualHost *:80>
    DocumentRoot "$ROOT"

    ServerName $SITE.loc

    ErrorLog "/usr/local/var/log/httpd/$SITE.loc-error_log"
    CustomLog "/usr/local/var/log/httpd/$SITE.loc-access_log" common
</VirtualHost>" >> /usr/local/etc/httpd/extra/httpd-vhosts.conf 

echo "Need sudo for hosts & apache restart"
echo "127.0.0.1	$SITE.loc" | sudo tee -a /etc/hosts > /dev/null
sudo apachectl restart

echo "Served at $SITE.loc"
