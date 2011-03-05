use strict;
use warnings;

my $fh;

open( $fh, "<", "quicklisp_documentation.txt") or die($!);
my @arr = <$fh>;
close $fh;

open( $fh, ">", "quicklisp_documentation.html") or die($!);
# Add in some better html conformance
print $fh "<html>";
print $fh "<body>";
print $fh "<table border=1>";
foreach my $line (@arr)
{
    my ($name, $packages, $desc) = split(/%%/, $line);
    print $fh "<tr><td> $name </td><td> $desc </td></tr>\n";
}
print $fh "</table>\n";
print $fh "<body>";
close $fh;

