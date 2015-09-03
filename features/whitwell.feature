Feature: Test Acme::Geo::Whitwell conversions
  As a developer planning to use Acme::Geo::Whitewell::Name
  I want to test the conversion of map coordinates to names and vice versa
  In order to get a technically correct good laugh

  Background:
    Given a usable Acme::Geo::Whitwell::Name class

    Scenario: Check names match the Whitwell standard
      Given coordinates <latitude> and <longitude>
      When we convert them
      Then we get <name1> and <name2>
      And the names are different
      And  the names have two parts
      Examples:
          | latitude | longitude | name1          | name2         |
          | 55.75    | 37.61     | Uleel Feema    | Lunu Inyb     |
          | -33.02   | -71.55    | Isite Navul    | Fivoud Eesalu |
          | -33.55   | 151.17    | Isilu Buban    | Fivul Alabee  |
          | 37.37    | -122.03   | Feefee Asedouf | Inin Beveti   |
          | 0.0      | 0.0       | Outou Tout     | Tout Outou    |
          | 82.50    | -62.34    | Bleeg Fnord    | Glorp Plonk   |
          | 3.8N     | 101.42E   | Ipou Boubod    | Feit Atake    |
          | 77.85S   | 166.76E   | Eeseepu Bymeem | Neeveil Amyny |
          | 51.51N   | 0.13W     | A B            | B A           |
          | 7.933S   | 14.37E    | X Y            | Y X           |
