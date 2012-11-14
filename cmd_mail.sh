#!/bin/bash -ex
#execute with bash and provide verbose output

#include configuration
. mail_conf.sh

#install function
install ()
{
	apt-get update
	DEBIAN_FRONTEND=noninteractive apt-get -y \
        -o DPkg::Options::=--force-confdef \
        -o DPkg::Options::=--force-confold \
        install $@
}

#Update; Install msmtp-mta and heirloom-mailx
install msmtp-mta heirloom-mailx

cat <<EOD > ~/.msmtprc
#Gmail account
defaults
logfile ~/msmtp.log

account $account_name
auth on
host smtp.gmail.com
from $email_address
auth on
tls on
tls_trust_file /usr/share/ca-certificates/mozilla/Equifax_Secure_CA.crt
user $email_address
password $secret
port 587

account default : $account_name
EOD

#protect configuration file with your password
chmod 600 ~/.msmtprc
#protect the script component with your password
chmod 700 ./mail_conf.sh

#configure mailx to us e msmtp to send mail
echo 'set sendmail="/usr/bin/msmtp"' >> ~/.mailrc
echo 'set message-sendmail-extra-arguments="-a gmail"' >> ~/.mailrc
