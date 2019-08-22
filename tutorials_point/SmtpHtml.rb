#SMTP with HTML
require 'net/smtp'

message = <<MESSAGE_END
From: Private Person <me@fromdomain.com>
To: A Test User <test@domain.com>
MIME-Version: 1.0
Content-type: text/html
Subject: SMTP e-mail test

This is a test e-mail message.

<b>This is HTML message.</b>
<h1>This is headline.</h1>
MESSAGE_END

Net::SMTP.start('localhost') do |smtp|
	smtp.send_message message, 'me@fromdomain.com', 'test@domain.com'
end