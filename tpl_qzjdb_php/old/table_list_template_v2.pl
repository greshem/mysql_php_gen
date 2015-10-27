#!/usr/bin/perl

use Template;
#use strict;
use DBI;
if(scalar(@ARGV) != 2)
{
	print "Usage gen_list.pl dbname table_name\n";
	exit(-1);
}
my $host='localhost';
my $port='3306';
my $user="root";
my $passwd='qianqian';
my $dsn="dbi:mysql:hostname=$host:port=$port:";
my $backup="/tmp/backup";
my $dbh= DBI->connect($dsn,$user,$passwd);
my %database;
my @fields ;
my $db=$ARGV[0];
my $table=$ARGV[1];
my $output;
$output="output/$db/".$table."_list.php";
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
	my $input="template/table_list.tpl";

	 # process input template, substituting variables
	 $template->process(\*DATA, $vars, $output )
	     || die $template->error();


__DATA__
<html>
<head>
<meta contentType="text/html" charset="GB2312">
</head>
<body>


<table  cellspacing=1 cellpadding=1  bgcolor=#aaaaaa width=800>
<?php 
include ("db_pages.inc.php");
include ("qzj_db.php");
$sqldb=new db;
$sqldb->connect_db("localhost", "root", "qianqian","[% db %]");
$sqldb->query("select * from [% table %]");
$count=$sqldb->get_count();
echo "COUNT ",$count,"\n";
$onepage=20;

$pb= new AsPagebar($count, $onepage);
$offset = $pb->offset();
$pagebar2=$pb->whole_bar(2,9);

echo "offset = ", $offset,"\n";
$limit=$offset+$onepage;
echo "limit".$limit;
echo "offset".$offset;
$sqldb->query("select * from [% table %] limit $offset ,$onepage ");
echo "count =".$sqldb->get_count();
echo "<tr bgcolor=#ffffff > [%FOREACH field IN fields %] <td> [%field%] </td> [%END%] </tr>"; 
 

while(list( [% FOREACH field IN fields %] $[% field %] ,[%END%] )=$sqldb->fetch_row())
{
	echo "<tr bgcolor=#ffffff >
				[%FOREACH field IN fields %] 
				<td>".substr($[%field%],0,64)."</td> 
				[%END%] <td><a href=[%table%]_modify.php?id=$id>�༭</a></td><td><a href=#>ɾ��</a></td><tr>\n";


}
?>
</table>

<div align="left">
<?php
echo $pagebar2,"\n";
?>
</div>
</body>
</html>
