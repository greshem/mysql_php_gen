#!/usr/bin/perl

use Template;
#use strict;
use DBI;
if(scalar(@ARGV) != 2)
{
	print "Usage gen_modify_ok.pl dbname table_name\n";
	exit(-1);
}
my $host='localhost';
my $port='3306';
my $user="root";
my $passwd='password';
my $dsn="dbi:mysql:hostname=$host:port=$port:";
my $backup="/tmp/backup";
my $dbh= DBI->connect($dsn,$user,$passwd);
my %database;
my @fields ;
my $db=$ARGV[0];
my $table=$ARGV[1];
my $output;
$output="$db/".$table."_modifyok.php";
unless ($dbh)
{
        print "Connect error!\n";

}
$dbh->do("use $db");
my $sth_table=$dbh->prepare("describe $table");
$sth_table->execute();
while( my @array = $sth_table->fetchrow_array())
{
	#print $array[0],"\t", $array[1], "\n";
	push @fields, $array[0];
}
	 # some useful options (see below for full list)
	 my $config = {
	#     INCLUDE_PATH => ’/search/path’,  # or list ref
	     INTERPOLATE  => 1,		      # expand "$var" in plain text
	     POST_CHOMP	  => 1,		      # cleanup whitespace
	  # PRE_PROCESS  => ’header’,	      # prefix each template
	     EVAL_PERL	  => 1,		      # evaluate Perl code blocks
	 };
	 # create Template object
	@a=qw( aaa bbb ccc ddd eee fff);
	 #my $template = Template->new($config);
	 my $template = Template->new();

	 # define template variables for replacement
	 my $vars = {
	     db  => $db,
	     table => $table,
	     fields => \@fields
	 };
	 
	 #my $input = ’a.tpl’;
	my $input="template/table_modifyok.tpl";


	 # process input template, substituting variables
	 $template->process($input, $vars,$output)
	     || die $template->error();


