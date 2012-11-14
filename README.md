<html>
<head>
</head>
<body>
<h2>Reference</h2>
http://tuxtweaks.com/2012/10/send-gmail-from-the-linux-command-line/
<h2>What it Currently Does</h2>
<ul>
<li>one of the files is interactive install and config; no editing required.
<li>Otherwise, Reads configuration from mail_conf.sh (edit this file to customize, for sure)
<li>Updates repos
<li>Installs msmtp-mta & heirloom-mailx from repositiories
<li>Configures msmtp-mta for gmail & based on variables in mail_conf.sh
<li>Configures mailx to use msmtp-mta
<li>Makes files with password information available only to you (chmod)
</ul>
<h2>Usage</h2>
<ul>
<li>Obtain with git clone or download and unzip.</li>
<li>If the .sh files aren't already executeable, chmod +x each file.
<li>Use a text editor (leafpad or nano, for example) to set the email account name, the gmail address, and the password to the mail account</li>
<li>Assuming you are at the command line and in the directory with the scripts, execute with: sudo cmd_mail.sh
</ul>
<h2>Example Usage</h2>
<pre>mail -s "Subject" address@example.com < message.txt</pre>
<p></p>
<h2>To Do</h2>
<ul>
<li>Scrap the configuration include and prompt user for addy, account name, and password (more secure, less configuration). It's not like that now because I'm used to automating and eliminating interactivity.
<li>If I get ambitious: prompt for info with dialog boxes (apt-get install dialog)
<li>If I get more ambitious: install and configure in a lab setting for specified list of users and corresponding passwords.
</ul>
</body>
</html>
