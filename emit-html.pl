use strict;
use warnings;

sub trim 
{
    my $str = shift;
    $str =~ s/^\s+(.*)\s+$/$1/;
}

my ($input, $output) = @ARGV;

die("Syntax: perl emit-html.pl $0 infile outfile") unless $input && $output;

my $fh;

my $data;
{ 
    local $/ = undef;
    open( $fh, "<", $input) or die($!);
    $data = <$fh>;
    close $fh;
}
# data has the form name %% systems %%  desc %%
#pulls the data in using parallel arrays
my @entries = $data =~ m/(.+?)%%
    (.+?)%%
    (.+?)%%/msgx;

#reshape the arrays to be less parallel.
@entries = map { 
    [ $entries[$_], 
      $entries[$_+1], 
      $entries[$_+2]] }  (map { $_ * 3 } (0 .. $#entries / 3));

open( $fh, ">", $output) or die($!);
# Add in some better html conformance
print $fh "<html>";
print $fh "<body>";
print $fh "<table border=1>";
foreach my $data_ref (@entries)
{
    my ($name, $packages, $desc) = @$data_ref;
    print $fh "<tr><td> $name </td><td> $desc </td></tr>\n";
}
print $fh "</table>\n";
print $fh "<body>";
close $fh;

