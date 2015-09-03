#!perl

 use strict;
 use warnings;

 use Test::More;
 use Test::BDD::Cucumber::StepFile;
 use Cwd;

Given qr/a usable (\S+) class/, sub {  use_ok( $1 ); };
Given qr/coordinates (\S+) and (\S+)/, sub {
    my $c = shift;
    $c->stash->{'scenario'}->{'latitude'} = $1;
    $c->stash->{'scenario'}->{'longitude'} = $2;
};
