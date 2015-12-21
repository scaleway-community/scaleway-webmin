## -*- docker-image-name: "scaleway/webmin:latest" -*-
FROM scaleway/ubuntu:trusty
MAINTAINER Scaleway <opensource@scaleway.com> (@scaleway)


# Prepare rootfs for image-builder
RUN /usr/local/sbin/builder-enter


RUN apt-get update \
 && apt-get upgrade -y -q \
 && apt-get install -y -q \
    apache2 \
    apache2-doc \
    apache2-suexec-custom \
    awstats \
    awstats \
    bind9 \
    bsdutils \
    clamav \
    clamav-base \
    clamav-daemon \
    clamav-docs \
    clamav-freshclam \
    clamav-testfiles \
    dovecot-common \
    dovecot-imapd \
    dovecot-pop3d \
    iptables \
    irb \
    libapache2-mod-fcgid \
    libapache2-mod-php5 \
    libapache2-svn \
    libcrypt-ssleay-perl \
    libcrypt-ssleay-perl \
    libdbd-mysql-perl \
    libdbd-pg-perl \
    libfcgi-dev \
    libnet-ssleay-perl \
    libpg-perl \
    libsasl2-2 \
    libsasl2-modules \
    libxml-simple-perl \
    mailman \
    mysql-client \
    mysql-common \
    mysql-server \
    openssl \
    php-pear \
    php5 \
    php5-cgi \
    php5-mysql \
    postfix \
    postfix-pcre \
    postgresql \
    postgresql-client \
    procmail \
    proftpd \
    python \
    quota \
    rdoc \
    ri \
    ruby \
    ruby \
    sasl2-bin \
    spamassassin \
    spamc \
    subversion \
    unzip \
    webalizer \
    zip \
 && apt-get clean


# Install webmin
RUN apt-get update \
 && apt-get upgrade -y -q \
 && apt-get install -y -q \
    apt-show-versions \
    libauthen-pam-perl \
    libio-pty-perl \
    libnet-ssleay-perl \
    libpam-runtime \
    openssl \
    perl \
    python \
 && apt-get clean
ENV WEBMIN_VERSION=1.770
RUN wget http://prdownloads.sourceforge.net/webadmin/webmin_${WEBMIN_VERSION}_all.deb \
 && dpkg -i webmin_${WEBMIN_VERSION}_all.deb \
 && rm -f webmin_${WEBMIN_VERSION}_all.deb

RUN sed -i "s/smtpd_use_tls=yes/smtpd_use_tls=no/" /etc/postfix/main.cf \
 && sed -i "s/inet_interfaces = .*/inet_interfaces = localhost/" /etc/postfix/main.cf

ADD ./patches/etc/ /etc/
ADD ./patches/root/ /root/
ADD ./patches/usr/local/ /usr/local/


# Clean rootfs from image-builder
RUN /usr/local/sbin/builder-leave
