package coatjava;

use strict;
use warnings;

use geometry;
my $mothers;
my $positions;
my $rotations;
my $types;
my $dimensions;
my $ids;
my %color = ('kapton' => "bf0000", "Al" => "2a3158", "gas" => " afb0ba", "Cu" => "fd7f00", "dlc" => "14b6ce", "Cr" => "1433ce", "glue" => "14ce3d", "g10" => "aa44d8", "nomex" => "ecdb3a");
my %colorGem = ('kapton' => "bf0000", "Al" => "2a3158", "gas" => " afb0ba", "Cu" => "fd7f00", "dlc" => "14b6ce", "Cr" => "1433ce", "glue" => "14ce3d", "g10" => "888808", "nomex" => "dddd3a");

# my @window = ("kapton", "Al", "gas");
# my @cathode = ("kapton", "Al", "gas");
# my @muRwell = ("Cu", "kapton", "dlc");
# my @capa_sharing_layer1 = ("glue", "Cr", "kapton");
# my @capa_sharing_layer2 = ("glue", "Cr", "kapton");
# my @readout1 = ("glue", "Cu", "kapton");
# my @readout2 = ("glue", "Cu", "kapton");
# my @readout3 = ("glue");
# my @support_skin1 = ("g10");
# my @support_skin2 =("g10");
# my @support_honeycomb = ("nomex");

my @window = ("kapton", "Al", "gas");
my @cathode = ("kapton", "Cu", "gas");
my @muRwell = ("Cu", "kapton");
my @dlc = ("dlc", "glue");
my @capa_sharing_layer1 = ("Cu", "glue");
my @capa_sharing_layer2 = ("Cu", "glue");
my @readout1 = ("Cu", "g10", "Cu");
my @readout2 = ("glue", "g10", "Cu");

# GEM-specific layers
my @gem1 = ("Cu", "kapton", "Cu");
my @gem2 = ("Cu", "kapton", "Cu");
my @gem3 = ("Cu", "kapton", "Cu", "glue");

sub make_regions
{
    my $nregion = 6;
    
    for(my $R=1; $R<=$nregion; $R++){
            print "Processing region: $R\n";  # Debug statement

            my %detector = init_det();
            my $vname = "LMU_region$R";

            $detector{"name"}        = $vname;
            $detector{"mother"}      = $mothers->{$vname};

            $detector{"description"} = "LDRD URwell,  Region $R";

            $detector{"pos"}         = $positions->{$vname};
            $detector{"rotation"}    = $rotations->{$vname};
            $detector{"type"}        = $types->{$vname};
            $detector{"dimensions"}  = $dimensions->{$vname};

            $detector{"color"}       = "aa0000";
            $detector{"material"}    = "G4_Galactic";
            $detector{"style"}       = 0;
            $detector{"visible"}     = 0;
            print_det(\%main::configuration, \%detector);
            make_chamber($R);
    }
}

sub make_chamber
{
        my $region = $_[0];

        print "Creating chamber for region: $region\n";  # Debug statement

        my %detector = init_det();
        my $vname = "region$region";
        $detector{"name"}        = $vname;
        $detector{"mother"}      = $mothers->{$vname};
        $detector{"description"} = "Region $region";

        $detector{"pos"} = $positions->{$vname};
        $detector{"rotation"} = $rotations->{$vname};
        $detector{"type"} = $types->{$vname};
        $detector{"dimensions"}  = $dimensions->{$vname};
        $detector{"color"}       = "4f84f7";
        $detector{"material"}    = "G4_Galactic";
        $detector{"style"}       = 0;
        $detector{"visible"}     = 0;
        print_det(\%main::configuration, \%detector);

        if ($region == 1 || $region == 6) {
        # GEM Layers
        print "Adding GEM layers for region: $region\n";  # Debug statement
        } 
        else {
        # URWELL Layers
        print "Adding URWELL layers for region: $region\n";  # Debug statement
        }

        # Layers specific to GEM detectors (Region 1 and Region 6)
 if ($region == 1 || $region == 6) {
        for (my $ii = 0; $ii <= $#window; $ii++) {
            make_layers($region, "window", $window[$ii]);
        }
        for (my $ii = 0; $ii <= $#cathode; $ii++) {
            make_layers($region, "cathode", $cathode[$ii]);
        }
        for (my $ii = 0; $ii <= $#gem1; $ii++) {
            make_layers($region, "gem1", $gem1[$ii]);
        }
        for (my $ii = 0; $ii <= $#gem2; $ii++) {
            make_layers($region, "gem2", $gem2[$ii]);
        }
        for (my $ii = 0; $ii <= $#gem3; $ii++) {
            make_layers($region, "gem3", $gem3[$ii]);
        }
        
        for (my $ii = 0; $ii <= $#readout1; $ii++) {
            make_layers($region, "readout1", $readout1[$ii]);
        }
        for (my $ii = 0; $ii <= $#readout2; $ii++) {
            make_layers($region, "readout2", $readout2[$ii]);
        }
    } 


# Layers specific to URWELL detectors (Regions 2, 3, 4, 5) 
else {   
        # Window
        for(my $ii=0; $ii<=$#window; $ii++) {
            make_layers($region, "window",$window[$ii]);
        }
        
        # Cathode
        for(my $ii=0; $ii<=$#cathode; $ii++) {
            make_layers($region, "cathode",$cathode[$ii]);
        }
        
        #muRwell
        for(my $ii=0; $ii<=$#muRwell; $ii++) {
            make_layers($region, "muRwell",$muRwell[$ii]);
        }

        # DLC layer
        for (my $ii = 0; $ii <= $#dlc; $ii++) {
            make_layers($region, "dlc", $dlc[$ii]);
        }
        
        #@capa_sharing_layer1
        for(my $ii=0; $ii<=$#capa_sharing_layer1; $ii++) {
            make_layers($region,"capa_sharing_layer1",$capa_sharing_layer1[$ii]);
        }
        
        #@capa_sharing_layer2
        for(my $ii=0; $ii<=$#capa_sharing_layer2; $ii++) {
            make_layers($region, "capa_sharing_layer2",$capa_sharing_layer2[$ii]);
        }
        
        #@readout1
        for(my $ii=0; $ii<=$#readout1; $ii++) {
            make_layers($region,  "readout1",$readout1[$ii]);
        }

        #@readout2
        for(my $ii=0; $ii<=$#readout2; $ii++) {
            make_layers($region,  "readout2",$readout2[$ii]);
        }
        
    }
}

# Layers

sub make_layers{
    
        my $region = $_[0];
        my $layer = $_[1];
        my $material = $_[2];
        my %detector = init_det();


        my $vname = "region$region"."_$layer"."_$material";

        if (!defined $mothers->{$vname}) {
    print "Warning: Undefined mother for $vname\n";
}
if (!defined $positions->{$vname}) {
    print "Warning: Undefined position for $vname\n";
}
if (!defined $dimensions->{$vname}) {
    print "Warning: Undefined dimensions for $vname\n";
}


        $detector{"name"}        = $vname;
        $detector{"mother"}      = $mothers->{$vname};# // 'default_mother';
        $detector{"description"} = "Region $region, $layer $material";
        $detector{"pos"} = $positions->{$vname};
        $detector{"rotation"} = $rotations->{$vname};
        $detector{"type"} = $types->{$vname};
        $detector{"dimensions"}  = $dimensions->{$vname};
        if($region eq 1 || $region eq 6) {
            $detector{"color"}       = $colorGem{$material};
        }
        else {
            $detector{"color"}       = $color{$material};
        }        
        $detector{"material"}    = $material;
       
        if($layer eq "cathode" && $material eq "gas" ){
            $detector{"sensitivity"} = "urwell";
            $detector{"hit_type"} = "urwell";
            $detector{"identifiers"} ="region manual $region layer manual 1 component manual 1";

        }


        $detector{"style"}       = 1;
        $detector{"visible"}     = 1;

        print_det(\%main::configuration, \%detector);

}


sub makeLMU
{

	($mothers, $positions, $rotations, $types, $dimensions, $ids) = @main::volumes;
    
    make_regions();


}



1;
