# Programming with Perl Modules, p14.
# perldoc perlfaq3
# apt install cpanminus
use lib '/home/myuser/perl5/lib/perl5';
# https://perldoc.perl.org/modules
# use Module::CoreList;
# perl -le "print for @INC"
# Intermediate Perl, p20.
# BEGIN { unshift @INC, '/home/myuser/lib'; }
use ExtUtils::Installed;
my $inst = ExtUtils::Installed->new();
my @modules = $inst->modules();
#print "$_\n"for @modules;
print "$_ " for @modules
=pod
C:\Strawberry\perl\bin>perl -le "print $^O"
MSWin32
(dos for freedos with perl 5.8.8)
(darwin for osx with perl 5.8.8 ; El Capitan 10.11/Mojave 10.14 with perl 5.18.2)
(WebPerl | Run Perl in the browser with WebPerl! https://webperl.zero-g.net/ )
(cygwin) This is perl 5, version 32, subversion 1 (v5.32.1) built for i686-cygwin-threads-64int-multi
(with 7 registered patches, see perl -V for more detail)
Copyright 1987-2021, Larry Wall
C:\Strawberry\perl\bin>perl check_modules.pl
Algorithm::C3 Algorithm::Diff Alien::Build Alien::GMP Alien::Libxml2 Alt::Crypt:
:RSA::BigInt App::cpanminus App::local::lib::Win32Helper App::module::version Ap
p::pmuninstall AppConfig Archive::Any::Lite Archive::Extract Archive::Tar Archiv
e::Zip Array::Diff Authen::SASL B::COW B::Hooks::EndOfScope B::Hooks::OP::Check
B::Lint B::Utils BerkeleyDB Bytes::Random::Secure CGI CPAN CPAN::DistnameInfo CP
AN::Meta::Check CPANPLUS CPANPLUS::Dist::Build Canary::Stability Capture::Tiny C
arp::Always Carp::Clan Class::Accessor Class::Accessor::Grouped Class::Accessor:
:Lite Class::C3 Class::C3::Componentised Class::Data::Inheritable Class::ErrorHa
ndler Class::Inspector Class::Load Class::Load::XS Class::Loader Class::Method::
Modifiers Class::Singleton Class::Tiny Class::XSAccessor Clone Clone::Choose Clo
ne::PP Compress::Raw::Bzip2 Compress::Raw::Lzma Compress::Raw::Zlib Compress::un
LZMA Config::Any Config::Perl::V Context::Preserve Convert::ASCII::Armour Conver
t::ASN1 Convert::PEM Crypt::Blowfish Crypt::CAST5_PP Crypt::CBC
 Crypt::DES Crypt::DES_EDE3 Crypt::DSA Crypt::DSA::GMP Crypt::IDEA Crypt::OpenPG
P Crypt::OpenSSL::AES Crypt::OpenSSL::Bignum Crypt::OpenSSL::DSA Crypt::OpenSSL:
:Guess Crypt::OpenSSL::RSA Crypt::OpenSSL::Random Crypt::OpenSSL::X509 Crypt::RC
4 Crypt::RC6 Crypt::RIPEMD160 Crypt::Random::Seed Crypt::Random::TESHA2 Crypt::R
ijndael Crypt::SSLeay Crypt::Serpent Crypt::Twofish CryptX DBD::ADO DBD::CSV DBD
::ODBC DBD::Oracle DBD::Pg DBD::SQLite DBD::mysql DBI DBIx::Class DBIx::Simple D
BM::Deep DB_File Data::Binary Data::Buffer Data::Dump Data::Dump::Streamer Data:
:Dumper::Concise Data::OptList Data::Printer Data::Random Data::Section Date::Pa
rse DateTime DateTime::Format::DateParse DateTime::Locale DateTime::TimeZone Dat
eTime::TimeZone::Local::Win32 Devel::CheckLib Devel::Declare Devel::GlobalDestru
ction Devel::OverloadInfo Devel::PPPort Devel::PartialDump Devel::StackTrace Dev
el::Symdump Devel::vscode Digest Digest::CMAC Digest::HMAC Digest::MD2 Digest::M
D5 Digest::Perl::MD5 Digest::SHA1 Digest::Whirlpool Dist::CheckConflicts Email::
Abstract Email::Address Email::Address::XS Email::Date::Format Email::MIME Email
::MIME::ContentType Email::MIME::Encodings Email::MIME::Kit Email::MessageID Ema
il::Sender Email::Simple Email::Stuffer Email::Valid Encode Encode::Locale Encod
e::compat Eval::Closure Excel::Writer::XLSX Exception::Class Exporter::Tiny ExtU
tils::CBuilder ExtUtils::Config ExtUtils::Depends ExtUtils::F77 ExtUtils::Helper
s ExtUtils::Install ExtUtils::InstallPaths ExtUtils::MakeMaker ExtUtils::MakeMak
er::CPANfile ExtUtils::Manifest ExtUtils::PL2Bat ExtUtils::PkgConfig FCGI FFI::C
heckLib FFI::Platypus FFI::Raw File::CheckTree File::Copy::Recursive File::Fetch
 File::Find::Object File::Find::Rule File::HomeDir File::Listing File::Map File:
:Path File::Remove File::ShareDir File::ShareDir::Install File::Slurp File::Slur
p::Tiny File::Slurper File::Temp File::Which File::chdir File::pushd Filter::Uti
l::Call FindBin GD Getopt::Long Graphics::ColorUtils HTML::Form HTML::Parser HTM
L::Tagset HTML::Tree HTTP::Cookies HTTP::Daemon HTTP::Date HTTP::Message HTTP::N
egotiate HTTP::Server::Simple Hash::Merge Hook::LexWrap IO IO::All IO::CaptureOu
tput IO::Compress IO::Compress::Lzma IO::HTML IO::Interactive IO::SessionData IO
::Socket::INET6 IO::Socket::IP IO::Socket::SSL IO::Socket::Socks IO::String IO::
Stringy IO::Zlib IPC::Run IPC::Run3 IPC::System::Simple Imager Importer JSON JSO
N::MaybeXS JSON::PP JSON::XS LWP::MediaTypes LWP::Protocol::https List::MoreUtil
s List::MoreUtils::XS Log::Message Log::Message::Simple Log::Report Log::Report:
:Optional MIME::Base64 MIME::Charset MIME::Types MailTools Math::Base::Convert M
ath::BigInt::GMP Math::GMP Math::Int64 Math::MPC Math::MPFR Math::Prime::Util Ma
th::Prime::Util::GMP Math::Random::ISAAC Math::Round Mock::Config Modern::Perl M
odule::Build Module::Build::Tiny Module::CPANTS::Analyse Module::CPANfile Module
::Find Module::Implementation Module::Load Module::Load::Conditional Module::Plu
ggable Module::Runtime Module::Runtime::Conflicts Mojolicious Moo MooX::Types::M
ooseLike Moose MooseX::ClassAttribute MooseX::Declare MooseX::LazyRequire MooseX
::Meta::TypeConstraint::ForceCoercion MooseX::Method::Sig
natures MooseX::NonMoose MooseX::Role::Parameterized MooseX::Traits MooseX::Type
s MooseX::Types::Structured Mozilla::CA Net Net::DNS Net::HTTP Net::IMAP::Client
 Net::Ping Net::SMTPS Net::SSH2 Net::SSLeay Net::Telnet Number::Compare OLE::Sto
rage_Lite Object::Accessor Object::Tiny OpenGL PAR PAR::Dist PAR::Dist::FromPPD
PAR::Dist::InstallPPD PAR::Repository::Client PAR::Repository::Query PPI PPM Pac
kage::Constants Package::DeprecationManager Package::Stash Package::Stash::XS Pa
dWalker Params::Util Params::ValidationCompiler Parse::Binary Parse::Method::Sig
natures Parse::RecDescent Path::Class Path::Tiny Perl Perl::PrereqScanner::NotQu
iteLite Perl::Tidy PerlIO::Layers PerlIO::via::QuotedPrint PkgConfig Pod::Checke
r Pod::Coverage Pod::LaTeX Pod::Parser Pod::Simple Pod::Usage Probe::Perl Regexp
::Trie Role::Tiny SOAP::Lite SQL::Abstract SQL::Abstract::Classic SQL::Statement
 Scope::Guard Socket Socket6 Software::License Sort::Naturally Sort::Versions Sp
ecio Spiffy Spreadsheet::ParseExcel Spreadsheet::ParseXLSX Spreadsheet::WriteExc
el String::Print String::RewritePrefix Sub::Exporter Sub::Exporter::ForMethods S
ub::Exporter::Progressive Sub::Identify Sub::Info Sub::Install Sub::Name Sub::Qu
ote Sub::Uplevel Sys::Syslog TAP::Harness::Restricted Task::Weaken Template Temp
late::Tiny Term::ReadKey Term::ReadLine Term::Table Term::UI Test2::Plugin::NoWa
rnings Test2::Suite Test::Base Test::CPAN::Meta Test::CleanNamespaces Test::Deep
 Test::Differences Test::Exception Test::FailWarnings Test::Fatal Test::File Tes
t::File::ShareDir Test::Fork Test::Kwalitee Test::LeakTrace Test::MockTime Test:
:More::UTF8 Test::Needs Test::NoWarnings Test::Number::Delta Test::Object Test::
Output Test::Pod Test::Pod::Coverage Test::Requires Test::RequiresInternet Test:
:Script Test::Simple Test::SubCalls Test::UseAllModules Test::Warn Test::Warning
s Test::Without::Module Test::YAML Test::utf8 Text::Balanced Text::CSV Text::CSV
_XS Text::Diff Text::Glob Text::Patch Text::Soundex Text::Template Text::Unideco
de Throwable Tie::Array::CSV Tie::EncryptedHash Tie::RefHash Time::Local Time::M
oment Tree::DAG_Node Try::Tiny Types::Serialiser URI URI::cpan Unicode::Collate
Unicode::LineBreak Unicode::UTF8 V Variable::Magic WWW::Mechanize WWW::RobotRule
s Win32 Win32::API Win32::Clipboard Win32::Console Win32::Console::ANSI Win32::D
aemon Win32::EventLog Win32::Exe Win32::File Win32::File::Object Win32::GuiTest
Win32::IPHelper Win32::Job Win32::OLE Win32::Pipe Win32::Process Win32::SerialPo
rt Win32::Service Win32::ServiceManager Win32::ShellQuote Win32::TieRegistry Win
32::UTCFileTime Win32::WinError Win32API::Registry XML::LibXML XML::LibXSLT XML:
:NamespaceSupport XML::Parser XML::Parser::Lite XML::SAX XML::SAX::Base XML::SAX
::Expat XML::Simple XML::Twig XString YAML YAML::LibYAML YAML::Tiny aliased auto
die common::sense cpan::SQLite cpan::outdated enum experimental libwww::perl loc
al::lib mro::Compat namespace::autoclean namespace::clean perlfaq pler superclas
s syntax syntax::Keyword::Junction version

