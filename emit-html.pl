open( my $fh, "<", "quicklisp_documentation.txt") or die($!);
my @arr = <$fh>;
close $fh;

open( $fh, ">", "quicklisp_documentation.html") or die($!);
# Add in some better html conformance
print $fh "<table width=1>";
foreach my $line (@arr)
{
    my ($name, $packages, $desc) = split(/%%/, $line);
    print $fh "<tr><td> $name </td><td> $desc </td></tr>\n";
}
print $fh "</table>\n";
close $fh;

