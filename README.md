# centre-benny-website
Sources for website of Centre Benny

## TODO

- update the main image on the home page
- configure the project with a custom theme using theme inheritance (inherit from the Quark theme), such as is described [here](https://learn.getgrav.org/themes/customization#theme-inheritance).

# Localhost setup guide

## Hosting the documentation pages locally

*Note: The following guide is meant for Ubuntu. It has been tested on clean installations of
versions 16.04 and 18.04.*

#### 1. Make sure system is up to date

```bash
sudo apt update
sudo apt upgrade
```

#### 2. Install apache, php and some other required modules

```bash
sudo apt install unzip apache2 php php-curl php-ctype php-dom php-gd php-json php-mbstring php-simplexml php-xml php-zip libapache2-mod-php -y
```

#### 3. Configure Apache

- Enable mod_rewrite and mod_userdir:

```bash
sudo a2enmod rewrite
```

- Set AllowOverride to All by making the following change to the file `/etc/apache2/apache2.conf` (around line ~172)

Before:

```

...

<Directory /var/www/>
        Options Indexes FollowSymLinks
        AllowOverride None
        Require all granted
</Directory>

...

```

After:

```

...

<Directory /var/www/>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
</Directory>

...

```

- Fix up `/var/www/html/` folder

```
sudo rm -rf /var/www/html/
sudo ln -s ./grav /var/www/html/
sudo chown www-data:www-data /var/www/html/
sudo chmod 775 /var/www/html/
```

- Finally, restart apache

```bash
sudo systemctl restart apache2
```

#### 4. Clone repository

#### 5. Fix permissions on grav folder

```bash
cd grav/
sudo ./permfixUbuntu.sh
```

#### 6. View docs and begin development

Open up a web browser and visit http://localhost to view the site as hosted on your
own machine.
