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
my $passwd='qianqian';
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
	#     INCLUDE_PATH => â€™/search/pathâ€™,  # or list ref
	     INTERPOLATE  => 1,		      # expand "$var" in plain text
	     POST_CHOMP	  => 1,		      # cleanup whitespace
	  # PRE_PROCESS  => â€™headerâ€™,	      # prefix each template
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
	 
	 #my $input = â€™a.tplâ€™;
	my $input="template/table_modifyok.tpl";


	 # process input template, substituting variables
	 $template->process(\*DATA, $vars,"output/".$output)
	     || die $template->error();
__DATA__
<html>

<head>
<meta contentType="text/html" charset="GB2312">
</head>
<?php
include ("qzj_db.php");

[%FOREACH field IN fields %]
$[%field%]=$_POST['[%field%]'];
[%END%]

$sqldb=new db;
$sqldb->connect_db("localhost","root","qianqian", "[%db%]");
//$sqldb->query("select * from [%table%] where  [%FOREACH field IN fields%]  and [%field%]=$[%field%]  [%END%] ");
$sqldb->query("select * from  [%table%] where id=$id");

if($sqldb->fetch_row())
{
// update Ç°ÃæÊÇ²»ÔÊÐí set id= µÄ, ÐèÒªÈ¥µô, ²»ÄÜ´øÄªÃûµÄ ¶ººÅ, Ò²ÐèÒªÈ¥µô, 
//¾ÍÊÇwhere µÄÌõ¼þÊÇid£¬ µ½×îºóÒªÓÃÀ´¸üÐÂid Óï·¨ÉÏÊÇ²»ÕýÈ·µÄ, ½â¾öµôÁË¡£ 20091020 
//¶àÓàµÄ¶ººÅ´¦Àíµô¡£ 
//sed 's/set id=//g' ÕâÃ´×÷
	$sqldb->query("update [%table%] set  
				[%FOREACH field IN fields%] 
				[%IF field != "id"%]
			,	[%field%]='$[%field%]'   [%END%]  [%END%]  
				where id=$id ");
	echo mysql_error(),"\n";
	echo "success\n";

  $query_string="select * from [%table%] where id=$_POST[id]; ";   
	$db_data=$sqldb->query($query_string);
  list( [%FOREACH field IN fields%] $[%field%], [%END%] ) = $sqldb->fetch_row($db_data);
?>
<table width="50%" border="0" cellspacing="1" cellpadding=3 align="center"> 
	<tr><td><a href="[%table%]_list.php"> [%db%]ÁÐ±í  </a> </td></tr>
</table>
	<table width="50%" border="1" cellspacing="1" cellpadding="3" align="center">
	<tr><td><a href=[%table%]_modify.php?id=<? echo $id?> > ÐÞ¸Ä </a> </td><td> ____ </td></tr>	
    [% FOREACH field IN fields%]

    <tr><td width="24%"> [%field%] </td> 
		<td width="76%"> 
		<?echo 	$[%field%]   ?>
		</td>
    </tr>
   [%END%]"
    
    
    
  </table>
<?
}
else
{
	echo "not  exists \n";
	echo mysql_error(),"\n";
}
?>
</html>

