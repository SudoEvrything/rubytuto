require 'net/smtp'

filename = "test.txt"
#read a file and encode it into base64 format
filecontent = File.read(filename)
encodedcontent = [filecontent].pack("m") #base64

marker = "AUNIQUEMARKER"
body = <<EOF
This is a test email to send an attachment.
EOF

#Defining main headers.
part1 = <<EOF
From: Private Person <me@fromdomain.com>
To: A Test User <test@domain.com>
Subject: Sending Attachment
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary = #{marker}
--#{marker}
EOF

#Define the message action
part2 = <<EOF
Content-Type: text/plain
Content-Transfer-Encoding:8bit

#{body}
--#{marker}
EOF

#Define the attachment part
part3 = <<EOF
Content-Type: multipart/mixed; name = \"#{filename}\"
Content-Transfer-Encoding:base64
Content-Disposition: attachment; filename = "#{filename}"
#{encodedcontent}
--#{marker}--
EOF

mailtext = part1 + part2 + part3

#Let's put our code in safe area
begin
	Net::SMTP.start('localhost') do |smtp|
		smtp.sendmail(mailtext, 'me@fromdomain.com', ['test@domain.com'])
	end
rescue Exception => e
	print "Exception occured: " + e
end	