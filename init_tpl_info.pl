#!/usr/bin/perl

use Template;
#use strict;
use DBI;
# my @fields=get_tpl_para("mysql", "user");
# print join("\n", @fields);
# 
# if(scalar(@ARGV) != 2)
# {
# 	print "Usage gen_list.pl dbname table_name\n";
# 	exit(-1);
# }

sub   get_tpl_para($$)
{
	(my $db, $table)=@_;;
	my $host='localhost';
	my $port='3306';
	my $user="root";
	my $passwd='password';
	my @fields ;

	my $dsn="dbi:mysql:hostname=$host:port=$port:";
	my $dbh= DBI->connect($dsn,$user,$passwd);

	unless ($dbh)
	{
			print "Connect error!\n";
	}

	$dbh->do("use $db");
	my $sth_table=$dbh->prepare("describe $table");
	$sth_table->execute();
	while( my @array = $sth_table->fetchrow_array())
	{
		push @fields, $array[0];
	}
	return @fields;
}


