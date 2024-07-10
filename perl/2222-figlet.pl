#!/usr/bin/env perl

# time perl perl/2222-figlet-fatpacked.pl [figlet font] [path to figlet fonts]

use v5.34;
use experimental qw/ signatures /;

my $font = $ARGV[0] // 'standard';
my $font_dir = $ARGV[1] // '/usr/share/figlet/';

use FindBin;
use Term::ANSIScreen qw/ cls /;
use Text::FIGlet;
use IO::All;
use Time::HiRes qw/ usleep /;

my $fig = Text::FIGlet->new( -d => '/usr/share/figlet/', -f => $font );

sub fig ( $text ) {
    cls;
    say for $fig->figify( -A => $text );
    usleep 603_960; # *cough* erm, the 4 is gone because screen drawing takes time?
}

fig $_ for io("$FindBin::Bin/../2222.txt")->chomp->getlines;

