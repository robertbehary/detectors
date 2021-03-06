use strict;
use warnings;

our %configuration;
our %parameters;

sub build_targets
{
	my $thisVariation = $configuration{"variation"} ;
	
	if($thisVariation eq "lH2" || $thisVariation eq "lD2")
	{
		# vacuum container
		my $Rout       = 44;
		my $length     = 50;  # half length
		my %detector = init_det();
		$detector{"name"}        = "scatteringChamberVacuum";
		$detector{"mother"}      = "root";
		$detector{"description"} = "clas12 scattering chamber vacuum rohacell container for $thisVariation target";
		$detector{"color"}       = "aaaaaa4";
		$detector{"type"}        = "Tube";
		$detector{"dimensions"}  = "0*mm $Rout*mm $length*mm 0*deg 360*deg";
		$detector{"material"}    = "G4_Galactic";
		$detector{"style"}       = "1";
		print_det(\%configuration, \%detector);
		
		
		# rohacell
		$Rout       = 43;
		$length     = 48;  # half length
		%detector = init_det();
		$detector{"name"}        = "scatteringChamber";
		$detector{"mother"}      = "scatteringChamberVacuum";
		$detector{"description"} = "clas12 rohacell scattering chamber for $thisVariation target";
		$detector{"color"}       = "ee3344";
		$detector{"type"}        = "Tube";
		$detector{"dimensions"}  = "0*mm $Rout*mm $length*mm 0*deg 360*deg";
		$detector{"material"}    = "rohacell";
		$detector{"style"}       = "1";
		print_det(\%configuration, \%detector);
		
		
		# vacuum container for aluminum cell
		$Rout       = 40;
		$length     = 45;  # half length
		%detector = init_det();
		$detector{"name"}        = "aluminumCellVacuum";
		$detector{"mother"}      = "scatteringChamber";
		$detector{"description"} = "clas12 rohacell vacuum aluminum container chamber for $thisVariation target";
		$detector{"color"}       = "aaaaaa4";
		$detector{"type"}        = "Tube";
		$detector{"dimensions"}  = "0*mm $Rout*mm $length*mm 0*deg 360*deg";
		$detector{"material"}    = "G4_Galactic";
		$detector{"style"}       = "1";
		print_det(\%configuration, \%detector);
		
		
		# aluminum cell
		$Rout       = 5.02;
		$length     = 25.03;  # half length
		%detector = init_det();
		$detector{"name"}        = "aluminumCell";
		$detector{"mother"}      = "aluminumCellVacuum";
		$detector{"description"} = "clas12 aluminum cell for $thisVariation target";
		$detector{"color"}       = "aaaaaa";
		$detector{"type"}        = "Tube";
		$detector{"dimensions"}  = "0*mm $Rout*mm $length*mm 0*deg 360*deg";
		$detector{"material"}    = "G4_Al";
		$detector{"style"}       = "1";
		print_det(\%configuration, \%detector);
		
		
		# actual target
		$Rout       = 5.00;
		$length     = 25.00;  # half length
		%detector = init_det();
		$detector{"name"}        = $thisVariation;
		$detector{"mother"}      = "aluminumCell";
		$detector{"description"} = "clas12 $thisVariation target";
		$detector{"color"}       = "ee8811Q";
		$detector{"type"}        = "Tube";
		$detector{"style"}       = "1";
		$detector{"dimensions"}  = "0*mm $Rout*mm $length*mm 0*deg 360*deg";
		
		if($thisVariation eq "lH2")
		{
			$detector{"material"}    = "G4_lH2";
		}
		if($thisVariation eq "lD2")
		{
			$detector{"material"}    = "LD2";
		}
		print_det(\%configuration, \%detector);
	}
	elsif($thisVariation eq "ND3")
	{
		# vacuum container
		my $Rout       = 44;
		my $length     = 50;  # half length
		my %detector = init_det();
		$detector{"name"}        = "scatteringChamberVacuum";
		$detector{"mother"}      = "root";
		$detector{"description"} = "clas12 scattering chamber vacuum rohacell container for $thisVariation target";
		$detector{"color"}       = "aaaaaa4";
		$detector{"type"}        = "Tube";
		$detector{"dimensions"}  = "0*mm $Rout*mm $length*mm 0*deg 360*deg";
		$detector{"material"}    = "G4_Galactic";
		$detector{"style"}       = "1";
		print_det(\%configuration, \%detector);
		
		
		# rohacell
		$Rout       = 43;
		$length     = 48;  # half length
		%detector = init_det();
		$detector{"name"}        = "scatteringChamber";
		$detector{"mother"}      = "scatteringChamberVacuum";
		$detector{"description"} = "clas12 rohacell scattering chamber for $thisVariation target";
		$detector{"color"}       = "ee3344";
		$detector{"type"}        = "Tube";
		$detector{"dimensions"}  = "0*mm $Rout*mm $length*mm 0*deg 360*deg";
		$detector{"material"}    = "rohacell";
		$detector{"style"}       = "1";
		print_det(\%configuration, \%detector);
		
		
		# vacuum container for plastic cell
		$Rout       = 40;
		$length     = 45;  # half length
		%detector = init_det();
		$detector{"name"}        = "plasticCellVacuum";
		$detector{"mother"}      = "scatteringChamber";
		$detector{"description"} = "clas12 rohacell vacuum aluminum container chamber for $thisVariation target";
		$detector{"color"}       = "aaaaaa4";
		$detector{"type"}        = "Tube";
		$detector{"dimensions"}  = "0*mm $Rout*mm $length*mm 0*deg 360*deg";
		$detector{"material"}    = "G4_Galactic";
		$detector{"style"}       = "1";
		print_det(\%configuration, \%detector);
		
  		# helium cylinder
		$Rout       = 12.62;
		$length     = 25.10;  # half length
		%detector = init_det();
		$detector{"name"}        = "HeliumCell";
		$detector{"mother"}      = "plasticCellVacuum";
		$detector{"description"} = "Helium volume for $thisVariation target";
		$detector{"color"}       = "aaaaaa3";
		$detector{"type"}        = "Tube";
		$detector{"dimensions"}  = "0*mm $Rout*mm $length*mm 0*deg 360*deg";
		#$detector{"material"}    = "G4_He";
		$detector{"material"}    = "G4_Galactic";#temporaly replacing with vacuum
		$detector{"style"}       = "1";
		print_det(\%configuration, \%detector);
		
		# plastic cylinder cell
		$Rout       = 12.60;
		$length     = 20.10;  # half length
		%detector = init_det();
		$detector{"name"}        = "plasticCell";
		$detector{"mother"}      = "HeliumCell";
		$detector{"description"} = "clas12 plastic cell for $thisVariation target";
		$detector{"color"}       = "aaaaaa";
		$detector{"type"}        = "Tube";
		$detector{"dimensions"}  = "0*mm $Rout*mm $length*mm 0*deg 360*deg";
		$detector{"material"}    = "G4_TEFLON"; #using teflon which is similar to the actual cell
		print_det(\%configuration, \%detector);
		
		
		# actual target
		$Rout       = 12.50; # target has a 25mm diamter
		$length     = 20.00;  # half length (target is 4cm long)
		%detector = init_det();
		$detector{"name"}        = $thisVariation;
		$detector{"mother"}      = "plasticCell";
		$detector{"description"} = "clas12 $thisVariation target";
		$detector{"color"}       = "ee8811Q";
		$detector{"type"}        = "Tube";
		$detector{"style"}       = "1";
		$detector{"dimensions"}  = "0*mm $Rout*mm $length*mm 0*deg 360*deg";
		
		$detector{"material"}    = "solidND3";
		print_det(\%configuration, \%detector);
		
	}

	# cad variation has two volume:
	# target container
	# and inside cell
	elsif($thisVariation eq "cad")
	{
		my $nplanes = 4;

		my @oradius  =  (    50.2,   50.2,  21.0,  21.0 );
		my @z_plane  =  (  -115.0,  265.0, 290.0, 375.0 );

		# vaccum target container
		my %detector = init_det();
		$detector{"name"}        = "target";
		$detector{"mother"}      = "root";
		$detector{"description"} = "Target Container";
		$detector{"color"}       = "22ff22";
		$detector{"type"}        = "Polycone";
		my $dimen = "0.0*deg 360*deg $nplanes*counts";
		for(my $i = 0; $i <$nplanes; $i++) {$dimen = $dimen ." 0.0*mm";}
		for(my $i = 0; $i <$nplanes; $i++) {$dimen = $dimen ." $oradius[$i]*mm";}
		for(my $i = 0; $i <$nplanes; $i++) {$dimen = $dimen ." $z_plane[$i]*mm";}
		$detector{"dimensions"}  = $dimen;
		$detector{"material"}    = "G4_Galactic";
		$detector{"style"}       = 0;
		print_det(\%configuration, \%detector);



 		$nplanes = 5;
		my @oradiusT  =  (   2.5,  10.3,  7.3,  5.0,  2.5);
		my @z_planeT  =  ( -24.2, -21.2, 22.5, 23.5, 24.5);

		# actual target
		%detector = init_det();
		$detector{"name"}        = "lh2";
		$detector{"mother"}      = "target";
		$detector{"description"} = "Target Cell";
		$detector{"color"}       = "aa0000";
		$detector{"type"}        = "Polycone";
		$dimen = "0.0*deg 360*deg $nplanes*counts";
		for(my $i = 0; $i <$nplanes; $i++) {$dimen = $dimen ." 0.0*mm";}
		for(my $i = 0; $i <$nplanes; $i++) {$dimen = $dimen ." $oradiusT[$i]*mm";}
		for(my $i = 0; $i <$nplanes; $i++) {$dimen = $dimen ." $z_planeT[$i]*mm";}
		$detector{"dimensions"}  = $dimen;
		$detector{"material"}    = "G4_lH2";
		$detector{"style"}       = 1;
		print_det(\%configuration, \%detector);

	}

}

1;






















