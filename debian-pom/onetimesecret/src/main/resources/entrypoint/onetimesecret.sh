#!/bin/bash

# set default for ots site host
if [ -z "$OTS_SITE_HOST" ]
then
    OTS_SITE_HOST="localhost:7143"
fi

# set default for ots site domain
if [ -z "$OTS_SITE_DOMAIN" ]
then
    OTS_SITE_DOMAIN="localhost"
fi

# set default for ots site ssl
if [ -z "$OTS_SITE_SSL" ]
then
    OTS_SITE_SSL="false"
fi

# set default for ots site secret
if [ -z "$OTS_SITE_SECRET" ]
then
    OTS_SITE_SECRET="CHANGEME"
fi

# set default for ots redis url
if [ -z "$OTS_REDIS_URI" ]
then
    OTS_REDIS_URI="redis://user:CHANGEME@127.0.0.1:7179/0?timeout=10&thread_safe=false&logging=false"
fi

# set default for ots email admin
if [ -z "$OTS_EMAIL_ADMIN" ]
then
    OTS_EMAIL_ADMIN="CHANGEME@EXAMPLE.com"
fi

# set default for ots smtp mode
if [ -z "$OTS_SMTP_MODE" ]
then
    OTS_SMTP_MODE=":smtp"
fi

# set default for ots smtp from
if [ -z "$OTS_SMTP_FROM" ]
then
    OTS_SMTP_FROM="delano@onetimesecret.com"
fi

# set default for ots smtp host
if [ -z "$OTS_SMTP_HOST" ]
then
    OTS_SMTP_HOST="localhost"
fi

# set default for ots smtp port
if [ -z "$OTS_SMTP_PORT" ]
then
    OTS_SMTP_PORT="25"
fi

# set default for ots smtp tls
if [ -z "$OTS_SMTP_TLS" ]
then
    OTS_SMTP_TLS="false"
fi

# set default for ots smtp user
if [ -z "$OTS_SMTP_USER" ]
then
    OTS_SMTP_USER=""
fi

# set default for ots smtp pass
if [ -z "$OTS_SMTP_PASS" ]
then
    OTS_SMTP_PASS=""
fi

# set default for ots smtp auth
if [ -z "$OTS_SMTP_AUTH" ]
then
    OTS_SMTP_AUTH=""
fi

# set default for ots incoming enabled
if [ -z "$OTS_INCOMING_ENABLED" ]
then
    OTS_INCOMING_ENABLED="false"
fi

# set default for ots incoming email
if [ -z "$OTS_INCOMING_EMAIL" ]
then
    OTS_INCOMING_EMAIL="example@onetimesecret.com"
fi

# set default for ots incoming passphrase
if [ -z "$OTS_INCOMING_PASSPHRASE" ]
then
    OTS_INCOMING_PASSPHRASE="CHANGEME"
fi

# set default for ots incoming regex
if [ -z "$OTS_INCOMING_REGEX" ]
then
    OTS_INCOMING_REGEX="\\A[a-zA-Z0-9]{6}\\z"
fi

# set default for ots stathat enabled
if [ -z "$OTS_STATHAT_ENABLED" ]
then
    OTS_STATHAT_ENABLED="false"
fi

# set default for ots stathat api key
if [ -z "$OTS_STATHAT_API_KEY" ]
then
    OTS_STATHAT_API_KEY="CHANGEME"
fi

# set default for ots stathat default chart
if [ -z "$OTS_STATHAT_DEFAULT_CHART" ]
then
    OTS_STATHAT_DEFAULT_CHART="CHANGEME"
fi

# set default for ots text nonpaid recipient
if [ -z "$OTS_TEXT_NONPAID_RECIPIENT" ]
then
    OTS_TEXT_NONPAID_RECIPIENT="You need to create an account!"
fi

# set default for ots text paid recipient
if [ -z "$OTS_TEXT_PAID_RECIPIENT" ]
then
    OTS_TEXT_PAID_RECIPIENT="Send the secret link via email"
fi

# set default for ots limits create secret
if [ -z "$OTS_LIMITS_CREATE_SECRET" ]
then
    OTS_LIMITS_CREATE_SECRET="250"
fi

# set default for ots limits create account
if [ -z "$OTS_LIMITS_CREATE_ACCOUNT" ]
then
    OTS_LIMITS_CREATE_ACCOUNT="10"
fi

# set default for ots limits update account
if [ -z "$OTS_LIMITS_UPDATE_ACCOUNT" ]
then
    OTS_LIMITS_UPDATE_ACCOUNT="10"
fi

# set default for ots limits email recipient
if [ -z "$OTS_LIMITS_EMAIL_RECIPIENT" ]
then
    OTS_LIMITS_EMAIL_RECIPIENT="50"
fi

# set default for ots limits send feedback
if [ -z "$OTS_LIMITS_SEND_FEEDBACK" ]
then
    OTS_LIMITS_SEND_FEEDBACK="10"
fi

# set default for ots limits authenticate session
if [ -z "$OTS_LIMITS_AUTHENTICATE_SESSION" ]
then
    OTS_LIMITS_AUTHENTICATE_SESSION="5"
fi

# set default for ots limits homepage
if [ -z "$OTS_LIMITS_HOMEPAGE" ]
then
    OTS_LIMITS_HOMEPAGE="500"
fi

# set default for ots limits dashboard
if [ -z "$OTS_LIMITS_DASHBOARD" ]
then
    OTS_LIMITS_DASHBOARD="1000"
fi

# set default for ots limits failed passphrase
if [ -z "$OTS_LIMITS_FAILED_PASSPHRASE" ]
then
    OTS_LIMITS_FAILED_PASSPHRASE="5"
fi

# set default for ots limits show metadata
if [ -z "$OTS_LIMITS_SHOW_METADATA" ]
then
    OTS_LIMITS_SHOW_METADATA="1000"
fi

# set default for ots limits show secret
if [ -z "$OTS_LIMITS_SHOW_SECRET" ]
then
    OTS_LIMITS_SHOW_SECRET="1000"
fi

# set default for ots limits burn secret
if [ -z "$OTS_LIMITS_BURN_SECRET" ]
then
    OTS_LIMITS_BURN_SECRET="1000"
fi

# replace variables in config file
sed -i "s|{OTS_SITE_HOST}|$OTS_SITE_HOST|g" /etc/onetime/config
sed -i "s|{OTS_SITE_DOMAIN}|$OTS_SITE_DOMAIN|g" /etc/onetime/config
sed -i "s|{OTS_SITE_SSL}|$OTS_SITE_SSL|g" /etc/onetime/config
sed -i "s|{OTS_SITE_SECRET}|$OTS_SITE_SECRET|g" /etc/onetime/config
sed -i "s|{OTS_REDIS_URI}|${OTS_REDIS_URI//&/\\&}|g" /etc/onetime/config
sed -i "s|{OTS_EMAIL_ADMIN}|$OTS_EMAIL_ADMIN|g" /etc/onetime/config
sed -i "s|{OTS_SMTP_MODE}|$OTS_SMTP_MODE|g" /etc/onetime/config
sed -i "s|{OTS_SMTP_FROM}|$OTS_SMTP_FROM|g" /etc/onetime/config
sed -i "s|{OTS_SMTP_HOST}|$OTS_SMTP_HOST|g" /etc/onetime/config
sed -i "s|{OTS_SMTP_PORT}|$OTS_SMTP_PORT|g" /etc/onetime/config
sed -i "s|{OTS_SMTP_TLS}|$OTS_SMTP_TLS|g" /etc/onetime/config
sed -i "s|{OTS_SMTP_USER}|$OTS_SMTP_USER|g" /etc/onetime/config
sed -i "s|{OTS_SMTP_PASS}|$OTS_SMTP_PASS|g" /etc/onetime/config
sed -i "s|{OTS_SMTP_AUTH}|$OTS_SMTP_AUTH|g" /etc/onetime/config
sed -i "s|{OTS_INCOMING_ENABLED}|$OTS_INCOMING_ENABLED|g" /etc/onetime/config
sed -i "s|{OTS_INCOMING_EMAIL}|$OTS_INCOMING_EMAIL|g" /etc/onetime/config
sed -i "s|{OTS_INCOMING_PASSPHRASE}|$OTS_INCOMING_PASSPHRASE|g" /etc/onetime/config
sed -i "s|{OTS_INCOMING_REGEX}|$OTS_INCOMING_REGEX|g" /etc/onetime/config
sed -i "s|{OTS_STATHAT_ENABLED}|$OTS_STATHAT_ENABLED|g" /etc/onetime/config
sed -i "s|{OTS_STATHAT_API_KEY}|$OTS_STATHAT_API_KEY|g" /etc/onetime/config
sed -i "s|{OTS_STATHAT_DEFAULT_CHART}|$OTS_STATHAT_DEFAULT_CHART|g" /etc/onetime/config
sed -i "s|{OTS_TEXT_NONPAID_RECIPIENT}|$OTS_TEXT_NONPAID_RECIPIENT|g" /etc/onetime/config
sed -i "s|{OTS_TEXT_PAID_RECIPIENT}|$OTS_TEXT_PAID_RECIPIENT|g" /etc/onetime/config
sed -i "s|{OTS_LIMITS_CREATE_SECRET}|$OTS_LIMITS_CREATE_SECRET|g" /etc/onetime/config
sed -i "s|{OTS_LIMITS_CREATE_ACCOUNT}|$OTS_LIMITS_CREATE_ACCOUNT|g" /etc/onetime/config
sed -i "s|{OTS_LIMITS_UPDATE_ACCOUNT}|$OTS_LIMITS_UPDATE_ACCOUNT|g" /etc/onetime/config
sed -i "s|{OTS_LIMITS_EMAIL_RECIPIENT}|$OTS_LIMITS_EMAIL_RECIPIENT|g" /etc/onetime/config
sed -i "s|{OTS_LIMITS_SEND_FEEDBACK}|$OTS_LIMITS_SEND_FEEDBACK|g" /etc/onetime/config
sed -i "s|{OTS_LIMITS_AUTHENTICATE_SESSION}|$OTS_LIMITS_AUTHENTICATE_SESSION|g" /etc/onetime/config
sed -i "s|{OTS_LIMITS_HOMEPAGE}|$OTS_LIMITS_HOMEPAGE|g" /etc/onetime/config
sed -i "s|{OTS_LIMITS_DASHBOARD}|$OTS_LIMITS_DASHBOARD|g" /etc/onetime/config
sed -i "s|{OTS_LIMITS_FAILED_PASSPHRASE}|$OTS_LIMITS_FAILED_PASSPHRASE|g" /etc/onetime/config
sed -i "s|{OTS_LIMITS_SHOW_METADATA}|$OTS_LIMITS_SHOW_METADATA|g" /etc/onetime/config
sed -i "s|{OTS_LIMITS_SHOW_SECRET}|$OTS_LIMITS_SHOW_SECRET|g" /etc/onetime/config
sed -i "s|{OTS_LIMITS_BURN_SECRET}|$OTS_LIMITS_BURN_SECRET|g" /etc/onetime/config

# start onetimesecret 
cd /var/lib/onetime && bundle exec thin -e dev -R config.ru -p $OTS_SITE_PORT start