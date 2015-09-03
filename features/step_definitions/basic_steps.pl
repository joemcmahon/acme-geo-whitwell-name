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

When qr/we convert them/, sub {
    my $c = shift;
    ($c->stash->{'scenario'}->{'name1'},
     $c->stash->{'scenario'}->{'name2'}) =
        Acme::Geo::Whitwell::Name::to_whitwell(
            $c->stash->{'scenario'}->{'latitude'},
            $c->stash->{'scenario'}->{'longitude'}
        );
};

Then qr/we get "(.*?)" and "(.*?)"/, sub {
    my $c = shift;
    my ($first, $second) = ($1, $2);
    is($first, $c->stash->{'scenario'}->{'name1'}, 'first name matches');
    is($second, $c->stash->{'scenario'}->{'name2'}, 'second name matches');
};

Then qr/the names are different/, sub {
    my $c = shift;
    isnt($c->stash->{'scenario'}->{'name1'},
         $c->stash->{'scenario'}->{'name2'},
         'names do not match');
};

Then qr/the names have two parts/, sub {
    my $c = shift;
    for my $name (qw(name1 name2)) {
        is( (split / /, $c->stash->{'scenario'}->{$name}), 2,
          "$name has two parts");
    }
}
