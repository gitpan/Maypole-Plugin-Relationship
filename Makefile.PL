use ExtUtils::MakeMaker;

WriteMakefile(
    NAME         => 'Maypole::Plugin::Relationship',
    AUTHOR       => 'Sebastian Riedel (sri@oook.de)',
    VERSION_FROM => 'Relationship.pm',
    PREREQ_PM    => {
        Maypole                            => '2.0',
        'Class::DBI::Loader::Relationship' => 0
    }
);
