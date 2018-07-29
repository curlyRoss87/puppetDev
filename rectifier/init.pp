# init pp file for puppet dev

# This will create a file in /home/rcleac1 with a speciied content

class rectifier {
	file {'/home/rcleac1/test':
	content => "This is a test file"
	}}
