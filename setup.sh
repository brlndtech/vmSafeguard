#!/bin/bash
echo -e "\e[33mThe installation process of EWMT will start in few seconds ... \e[39m"
if [ "$1" == "docker" ]; then
    echo -e "\e[32m-----> Setup customization for docker container is starting ...\e[39m"
    sleep 2
    sudo apt -y install git apache2 php sqlite3 php-sqlite3 htop wget sudo curl
    sudo git clone https://github.com/archidote/vmSafeguard
    sudo mv vmSafeguard /var/www/html
    sudo chmod 700 -R /var/www/html/vmSafeguard
    sudo chown -R www-data:www-data /var/www/html/vmSafeguard
    sudo echo 'www-data ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers.d/myOverrides
    sudo sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf
    sudo a2enmod ssl
    sudo a2enmod rewrite
    sudo a2ensite default-ssl.conf
    echo -e "\e[32mDone !\e[39m"
else
    echo -e "\e[32m-----> Normal installation is starting ...\e[39m"
    sleep 2
    sudo apt -y install git apache2 php sqlite3 php-sqlite3 htop wget sudo curl
    sudo git clone https://github.com/archidote/vmSafeguard
    sudo mv vmSafeguard /var/www/html
    sudo chmod 700 -R /var/www/html/vmSafeguard
    sudo chown -R www-data:www-data /var/www/html/vmSafeguard
    sudo echo 'www-data ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers.d/myOverrides
    sudo sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf
    sudo a2enmod ssl
    sleep 2
    sudo systemctl restart apache2
    sleep 2
    sudo a2enmod rewrite
    sleep 2
    sudo a2ensite default-ssl.conf
    sudo systemctl restart apache2
    sleep 2
    sudo systemctl enable apache2
    echo -e "\e[32mDone !\e[39m"
fi
