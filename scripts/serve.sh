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

echo "Need sudo for apache restart"
sudo apachectl restart

echo "Served at $SITE.loc"
