#!/usr/bin/perl -w

#use strict;
use DBI;
use File::Basename;
our $dbh;

#connect [% db %]
#use [% table %]

#####
#查询。

sub insertTo[%table%]()
{
	[% FOREACH field IN fields %] $[%field%]= rand;
	[%END%]
	$query="insert into [% table %] ( [%FOREACH field IN fields%] [%field%], [%END%]) values  ( [%FOREACH field IN fields %]   '$[%field%]',  [%END%]) ;"; 

	
	 $dbh = DBI->connect (
		#"dbi:mysql:database=huanqiuweb:host=localhost;mysql_emulated_prepare=0",
		"dbi:mysql:database=[%db%]:host=localhost;",
		"root", "password",
		{ RaiseError => 1, PrintError => 0 },
		);

	##
	#step1. 数据插入。 
	my $s_q = $dbh->prepare($query);
	   $s_q->execute();

}

###################
#step2. 数据查看， dump
sub showAll[%db%]_[%table%]_record()
{
	#my $query="select * from [%table%] limit 0 100 ;";
	my $query="select * from [%table%]  ;";
	my $s_q=$dbh->prepare($query);
		$s_q->execute();
	while(my @data =$s_q->fetchrow_array())
	{
		print join("|", @data),"\n";
	}
	$s_q->finish();
}
	

insertTo[%table%]();
showAll[%db%]_[%table%]_record();
