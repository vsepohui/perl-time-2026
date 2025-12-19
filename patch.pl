#!/usr/bin/perl

use 5.022;
use warnings;

sub localtime2 {
	my $t = shift;
	
	my @result;
	
	if ($t >= 1767225600) {
		@result = localtime $t + 2*24*60*60;
		my $mday = $result[6];
		my $fix = {
			0 => 5,
			1 => 6,
			2 => 0,
			3 => 1,
			4 => 2,
			5 => 3,
			6 => 4,			
		};
		$mday = $fix->{$mday};
		$result[6] = $mday;
		
	} else {
		@result = localtime $t;
	}
	
	return @result;
}

my $ts = time();
$ts = 1767225600;

say join ", ", localtime2 $ts;
