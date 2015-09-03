use Test::More;
use Acme::Geo::Whitwell::Name;

plan tests=>5;

eval { Acme::Geo::Whitwell::Name::_latitude_build("BLORP") };
like $@, qr/'BLORP' does not look like a proper coordinate/,
         "right message";

eval { Acme::Geo::Whitwell::Name::_latitude_build("35neSw") };
like $@, qr/Multiple conflicting sign indicators detected in '35neSw'/,
         "right message";

eval { Acme::Geo::Whitwell::Name::_latitude_build("35ne") };
like $@, qr/Multiple sign indicators detected in '35ne'/,
         "right message";

eval { Acme::Geo::Whitwell::Name::_latitude_build("35SW") };
like $@, qr/Multiple sign indicators detected in '35SW'/,
         "right message";

eval { Acme::Geo::Whitwell::Name::_latitude_build("-35N") };
like $@, qr/Multiple conflicting sign indicators detected in '-35N'/,
         "right message";
