# centre-benny-website
Sources for website of Centre Benny

## TODO

- MAJOR TODO: convert site to use CloudFront + S3 using https://github.com/BarryMode/grav-plugin-blackhole
- update the main image on the home page
- configure the project with a custom theme using theme inheritance (inherit from the Quark theme), such as is described [here](https://learn.getgrav.org/themes/customization#theme-inheritance).

# Installation guide

*Note: The following guide is meant for Ubuntu. It has been tested on clean installations of
versions 16.04 and 18.04.*

#### 1. Make sure system is up to date

```bash
sudo apt update
sudo apt upgrade
```

#### 2. Clone the repository

#### 3. Install apache, php and some other required modules

```bash
sudo apt install unzip apache2 php php-curl php-ctype php-dom php-gd php-json php-mbstring php-simplexml php-xml php-zip libapache2-mod-php -y
```

#### 4. Configure Apache

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
sudo ln -s {absolute path to repo}/grav /var/www/html
```

- Finally, restart apache

```bash
sudo systemctl restart apache2
```

#### 5. Fix permissions on grav folder

```bash
cd grav/
sudo ./permfixUbuntu.sh
```

#### 6. Add user to apache group

```bash
sudo usermod -a -G www-data ubuntu
```

Log out + log in after doing this.

#### 7. View docs and begin development

Open up a web browser and visit http://localhost (or http://domainname) to view the site

# Sass

## Install

```
npm install -g sass
```

## Watch scss sources

```
sass --watch scss:css-compiled --style compressed
```
