use Test::More;
use Acme::Geo::Whitwell::Name;

plan tests => 72;
# Numbers < -180 or > 180 die.
eval { Acme::Geo::Whitwell::Name::_two_decimal(-500) };
ok $@, "< -180 dies";
eval { Acme::Geo::Whitwell::Name::_two_decimal(500) };
ok $@, "> 180 dies";

my $two_digit;

my @in  = qw( 0    10    10.0  10.00 100.0000 000000000 -100.0);
my @out = qw( 0.00 10.00 10.00 10.00 100.00   0.00      100.00 );
while (@in) {
    my $number = shift @in;
    my $answer = shift @out;
    foreach my $suffix ('', qw(N S W E)) {
        $two_digit = Acme::Geo::Whitwell::Name::_two_decimal("$number$suffix");
        ok $two_digit, "Converted $number$suffix to $two_digit";
        is $two_digit, $answer, "Got expected value $answer";
    }
}
