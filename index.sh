#!/bin/bash
echo 'started...'
echo 'Enter site name. (For example example.dev)'
read SITENAME

echo 'Creating host...'
echo 'Copy yhis text to editor (CTRL/ins in terminal)'
echo '<VirtualHost *:80>'
echo ' ServerAdmin webmaster@'$SITENAME
echo '	ServerName ' $SITENAME
echo '	DocumentRoot /home/alex/www/'$SITENAME
echo '	<Directory /home/alex/www/'$SITENAME'/>'
echo '	Options Indexes FollowSymLinks MultiViews
AllowOverride All
Require all granted
</Directory>
ErrorLog ${APACHE_LOG_DIR}/error.log
CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>'
sudo gedit '/etc/apache2/sites-available/'$SITENAME'.conf'
sudo gedit /etc/hosts
sudo a2ensite $SITENAME'.conf'
echo 'Restarting Apache'
sudo service apache2 reload

echo $SITENAME
echo ' Enjoy!'
exit
