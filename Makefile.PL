use 5.008_007;
use ExtUtils::MakeMaker;
use strict;
use warnings;
use Config;
use Getopt::Long 'GetOptions';

GetOptions(
  'meta' => \my $meta,
  'no-build-spvm-modules' => \my $no_build_spvm_modules,
);

if ($meta) {
  $no_build_spvm_modules = 1;
}

unless ($meta) {
  # Do something such as environment check.
}

my %configure_and_runtime_requires = ('SPVM' => '0.990002');
WriteMakefile(
  NAME              => 'SPVM::JSON',
  VERSION_FROM      => 'lib/SPVM/JSON.pm', # finds $VERSION
  PREREQ_PM         => {}, # e.g., Module::Name => 1.1
  LICENSE           => 'mit',
  ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
    (ABSTRACT_FROM  => 'lib/SPVM/JSON.pm', # retrieve abstract from module
     AUTHOR         => 'Yuki Kimoto<kimoto.yuki@gmail.com>') : ()),
  test => {TESTS => 't/*.t'},
  clean => {FILES => ".spvm_build"},
  META_MERGE => {
      'meta-spec' => { version => 2 },
      resources => {
          repository => {
              type => 'git',
              url  => 'https://github.com/yuki-kimoto/SPVM-JSON.git',
              web  => 'https://github.com/yuki-kimoto/SPVM-JSON',
          },
      },
  },
  NORECURS => 1,
  CONFIGURE_REQUIRES => {
    %configure_and_runtime_requires,
  },
  PREREQ_PM         => {
    %configure_and_runtime_requires,
    'SPVM::Math' => '1.001',
  },
  TEST_REQUIRES => {
    
  },
);

# Add Build shared library make rule
sub MY::postamble {

  my $make_rule = '';
  
  unless ($no_build_spvm_modules) {
    require SPVM::Builder::Util::API;
    
    $make_rule .= SPVM::Builder::Util::API::create_make_rule_precompile('JSON');
  }
  
  return $make_rule;
}

1;
