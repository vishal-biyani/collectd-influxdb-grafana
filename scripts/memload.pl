#!/usr/bin/perl

# store and validate the command line parameter
$mb = $ARGV[0];
unless ( defined $mb and $mb =~ /^\d+$/ and $mb >= 1)  {
    die "Usage: $0 <occupy MB>\nEx: $0 100 - occupies 100 MB memory\n"
}
# convert it to bytes.
$b = $mb * 1024 * 1024;

# open in-memory file, and seek to size specified to get memory from OS.
open MEM, '>', \$memfile;
seek MEM, $b - 1, 0;
print MEM 'A';
close MEM;
printf "$mb MB memory is occupied, press ENTER to release: "; <STDIN>;

# till here the memory is occupied by this program.
undef $memfile;
printf "Memory released";
