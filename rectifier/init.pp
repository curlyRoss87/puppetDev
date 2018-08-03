# Init pp for product install 

class rectifier (

# Define the Variables needed in the class structure

	hardware	type = undef, 	# Hardware to install on
	$subType	type = undef,	# Lowside or highside
	$mgmtIf		type = undef,	# Management interface
	$ddsIf		type = undef,	# Data interface
	$ddsNetWk	type = undef,	# Data Network Address
	$ddsGW		type = undef,	# Data Network Gateway
	$ddsMask	type = undef,	# Data NetMask in CIDR Notation i.e. 24 for /24 or 255.255.255.0
	$version	type = undef,	# Version to install, explicit or Latest

)
{
	service {'diode.target':
	name	=> 'diode.target',
	ensure	=> running,
	enable	=> true,
	}

 	case $component	 {
		'lowside' {
	class rectifier::lowside::p_install.pp {
		require 	=> version['$version'],
		notify		=> Service['diode.target'],
			
		

		}
	}
     		highside { notify ("You are installing the highside")
		}
	}

}

class rectifier:lowside {
	file_line { 'rectifier_type = $subType':
	match => '^rectifier_type',
	notify =>  Service['diode.target'],
	}
}












