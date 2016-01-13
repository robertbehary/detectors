#!/usr/bin/perl -w


use strict;
use lib ("$ENV{GEMC}/api/perl");
use utils;
use parameters;
use geometry;
use hit;
use bank;
use math;

use Math::Trig;

# Help Message
sub help()
{
	print "\n Usage: \n";
	print "   forwardCarriage.pl <configuration filename>\n";
 	print "   Will create the CLAS12 forward carriage envelope that contains the various detectors\n";
 	print "   Note: The passport and .visa files must be present if connecting to MYSQL. \n\n";
	exit;
}

# Make sure the argument list is correct
if( scalar @ARGV != 1) 
{
	help();
	exit;
}

# Loading configuration file and paramters
our %configuration = load_configuration($ARGV[0]);

my $nplanes_Cone = 8;

# Notice:
# The FC coordinates are the same as CLAS12 target center
my @z_plane_Cone = ( 1206.0,  1556.0, 2406.0, 2664.0, 2664.0, 5051.0, 5051.0, 8500.0 );
my @iradius_Cone = ( 2575.0,  2000.0,  132.0,  132.0,   61.5,   61.5,  197.0,  197.0 );
my @oradius_Cone = ( 2575.0,  3500.0, 4800.0, 5000.0, 5000.0, 5000.0, 5000.0, 5000.0 );

sub build_fc
{
	my %detector = init_det();
	
	$detector{"name"}        = "fc";
	$detector{"mother"}      = "root";
	$detector{"description"} = "Forward Carriage (FC) detector envelope to hold the torus magnet and the FC detectors";
	$detector{"pos"}         = "0*mm 0.0*mm 0*mm";
	$detector{"rotation"}    = "0*deg 0*deg 0*deg";
	$detector{"color"}       = "88aa88";
	$detector{"type"}        = "Polycone";
	
	my $dimen = "0.0*deg 360*deg $nplanes_Cone*counts";
	for(my $i = 0; $i <$nplanes_Cone; $i++) {$dimen = $dimen ." $iradius_Cone[$i]*mm";}
	for(my $i = 0; $i <$nplanes_Cone; $i++) {$dimen = $dimen ." $oradius_Cone[$i]*mm";}
	for(my $i = 0; $i <$nplanes_Cone; $i++) {$dimen = $dimen ." $z_plane_Cone[$i]*mm";}
	$detector{"dimensions"}  = $dimen;

	$detector{"material"}    = "G4_AIR";
	$detector{"mfield"}      = "clas12-torus-big";
	$detector{"visible"}     = 0;
	$detector{"style"}       = 0;
	print_det(\%configuration, \%detector);
}



build_fc();
