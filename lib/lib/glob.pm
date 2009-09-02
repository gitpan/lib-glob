package lib::glob;

use warnings;
use strict;

our $VERSION = '0.01';

use File::Glob qw(bsd_glob);

my $sep = quotemeta($^O =~ /Win32/ ? ';' : ':');

sub import {
    my $class = shift;
    for (split /$sep/o, join ',', @_) {
	# print "looking for libraries in $_\n";
	my @paths = bsd_glob($_);
	push @INC, @paths;
    }
}

1;
__END__

=head1 NAME

lib::glob - glob patter and add to module seach path

=head1 SYNOPSIS

From Perl...

    use lib::glob '../*/lib';
    use lib::glob '*/lib:/usr/local/perl/*/lib';

And from the shell...

    perl -Mlib::glob='*/lib:/usr/local/perl/*/lib' script.pl


=head1 DESCRIPTION

This module globs the given paths and add then to @INC.

Several path patterns can be passed in a single call separated by a
colon (or a semicolon on Windows).

=head1 BUGS

Please report any bugs or feature requests to C<bug-lib-glob at
rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=lib-glob>.  I will be
notified, and then you'll automatically be notified of progress on
your bug as I make changes.

=head1 COPYRIGHT & LICENSE

Copyright 2009 Salvador FandiE<ntilde>o (sfandino@yahoo.com), all
rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl 5.10.0 or later itself.

=cut
