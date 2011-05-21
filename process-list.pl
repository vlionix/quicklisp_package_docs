# This reads in the quicklisp_package_src.txt and formats in
# placeholders for documentation.
use strict;
use warnings;

open( my $fh, "<", "quicklisp_package_src.txt") or die($!);
my @arr = <$fh>;
foreach my $line (@arr)
{
    chomp $line;
    $line =~ s/\s/ %% /;
    $line =~ s/$/ %% Todo-Insert-Documentation-Here %%\n/;
    #$line =~ s/,/;/;
#    print $line;
 
}
close $fh;
#exit(0);
open( $fh, ">", "quicklisp_documentation.txt") or die($!);
foreach my $line (@arr)
{
    print $fh $line;
}
close $fh;

