package Maypole::Plugin::Relationship;

use strict;
use NEXT;
use Class::DBI::Loader::Relationship;

Maypole::Config->mk_accessors('relationships');

our $VERSION = '0.03';

=head1 NAME

Maypole::Plugin::Relationship - Simple Relationships for Maypole

=head1 SYNOPSIS

Simple example:

    package MyApp;

    use Maypole::Application qw(Relationship);

    MyApp->config->relationships(
        [ 'beer has bottles', 'a brewery produces beers' ] );
    MyApp->setup( 'dbi:Pg:dbname=myapp', 'myuser', 'mypass' );

With Maypole::Plugin::Config::YAML:

    package MyApp;

    use Maypole::Application qw(Config::YAML Relationship -Setup);

    __DATA__
    --- #YAML:1.0
    application_name: MyApp
    dsn: dbi:Pg:dbname=myapp
    user: postgres
    pass: 0
    opts:
      AutoCommit: 1
    template_root: '/home/sri/MyApp/templates'
    uri_base: http://localhost/myapp
    relationships:
      - beer has bottles
      - a brewery produces beers
    
=head1 DESCRIPTION

Useful in combination with Maypole::Config::YAML.

Note that you need Maypole 2.0 or newer to use this module!

=cut

sub setup {
    my $r = shift;
    $r->NEXT::DISTINCT::setup(@_);
    $r->config->loader->relationship($_) for ( @{ $r->config->relationships } );
}

=head1 AUTHOR

Sebastian Riedel, C<sri@oook.de>

=head1 LICENSE

This library is free software. You can redistribute it and/or modify it under
the same terms as perl itself.

=cut

1;
