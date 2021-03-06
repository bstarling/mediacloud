# 1.
# 2. This file lists *direct* Perl module dependencies of Media Cloud.
# 3.
# 4. See:
# 5.
# 6.     doc/carton.txt
# 7.
# 8. for instructions on how to add a new Perl module dependency.
# 9.
requires 'AI::DecisionTree';
requires 'Array::Compare';
requires 'Carp::Always';
requires 'Carton::CLI';
requires 'Catalyst', '5.90030';
requires 'Catalyst::Action::RenderView';
requires 'Catalyst::Action::REST';
requires 'Catalyst::Authentication::User::Hash';
requires 'Catalyst::Controller::HTML::FormFu';
requires 'Catalyst::Controller::REST';
requires 'Catalyst::Plugin::Authorization::ACL';
requires 'Catalyst::Plugin::Authorization::Roles';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::I18N';
requires 'Catalyst::Plugin::Session::Store::FastMmap';
requires 'Catalyst::Plugin::Session::Store::File';
requires 'Catalyst::Plugin::StackTrace';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::Plugin::Unicode';
requires 'Catalyst::Restarter';
requires 'Catalyst::Runtime', '5.90030';
requires 'Catalyst::View::TT';
requires 'CGI';
requires 'CHI', '>= 0.60';
requires 'Color::Mix';
requires 'Crypt::SaltedHash';
requires 'Data::Dumper';
requires 'Data::Serializer';
requires 'Data::Sorting';
requires 'Date::Calc';
requires 'Devel::Cover', '1.17';
requires 'Devel::Cover::Report::Coveralls', '0.11';
requires 'Devel::NYTProf';
requires 'Dir::Self';
requires 'Domain::PublicSuffix';
requires 'Email::MIME';
requires 'Email::Sender::Simple';
requires 'Encode::HanConvert';
requires 'ExtUtils::MakeMaker';
requires 'FCGI';
requires 'FCGI::ProcManager';
requires 'File::ReadBackwards';
requires 'forks', '0.34';
requires 'GraphViz';
requires 'GraphViz2';
requires 'HTML::Entities';
requires 'HTML::FormFu';
requires 'HTML::FormFu::Element::reCAPTCHA';
requires 'HTML::LinkExtractor';
requires 'HTML::TreeBuilder::LibXML';
requires 'Inline';
requires 'Inline::Python', '0.52';
requires 'IO::Compress::Bzip2';
requires 'IO::Compress::Gzip';
requires 'JSON::XS';
requires 'Lingua::Identify::CLD', '0.10';
requires 'Lingua::Sentence';
requires 'Lingua::Stem::Snowball';
requires 'Lingua::Stem::Snowball::Lt', '0.02';
requires 'Lingua::ZH::WordSegmenter';
requires 'List::Compare';
requires 'List::MoreUtils', '0.413';
requires 'Log::Log4perl';
requires 'LWP::Protocol::https';
requires 'LWP::UserAgent', '6.15';
requires 'LWP::UserAgent::Determined';
requires 'Math::Prime::Util';
requires 'Math::Random';
requires 'Math::Random::Secure';
requires 'MediaCloud::JobManager', '0.26';
requires 'Memoize';
requires 'Modern::Perl', '1.20150127';
requires 'Module::Install';
requires 'Moose';
requires 'namespace::autoclean';
requires 'Net::Amazon::S3';
requires 'Net::IP';
requires 'Net::Twitter';
requires 'Parallel::Fork::BossWorkerAsync';
requires 'Parallel::ForkManager';
requires 'Parse::BooleanLogic';
requires 'Perl::Tidy', '20160302';
requires 'Readonly';
requires 'Readonly::XS';
requires 'Regexp::Common';
requires 'Regexp::Common::time';
requires 'Scalar::Defer';
requires 'Statistics::Basic';
requires 'Sys::RunAlone';
requires 'Template';
requires 'Term::Prompt';
requires 'Test::Differences';
requires 'Test::NoWarnings';
requires 'Test::Strict';
requires 'Text::CSV_XS', '1.26';
requires 'Text::Hunspell';
requires 'Text::Lorem::More';
requires 'Text::Trim';
requires 'Text::WordDiff';
requires 'Tie::Cache';
requires 'XML::FeedPP';
requires 'XML::LibXML';
requires 'XML::Simple';
requires 'YAML::Syck';
