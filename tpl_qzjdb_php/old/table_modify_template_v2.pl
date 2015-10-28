#!/usr/bin/perl

use Template;
#use strict;
use DBI;

if(scalar(@ARGV) != 2)
{
	print "Usage gen_modify.pl dbname table_name\n";
	exit(-1);
}
my $host='localhost';
my $port='3306';
my $user="root";
my $passwd='passwordn';
my $dsn="dbi:mysql:hostname=$host:port=$port:";
my $backup="/tmp/backup";
my $dbh= DBI->connect($dsn,$user,$passwd);
my %database;
my @fields ;
my $db=$ARGV[0];
my $table=$ARGV[1];
my $output;
$output="$db/".$table."_modify.php";
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
	my $input="template/table_modify.tpl";

	 # process input template, substituting variables
	 $template->process(\*DATA, $vars, "output/".$output)
	     || die $template->error();

__DATA__
<html>
<head>
<meta contentType="text/html" charset="GB2312">
</head>
<?
//³õÊ¼»¯session
session_start();
//include ('head.php');
require ('qzj_db.php');
// Èç¹ûÃ»ÓÐµÇÂ¼£¬ÍË³ö
/*if(!isset($_SESSION['Adm'])) {
   echo "<p align=center>";
   echo "<font color=#FF0000 size=5><strong><big>";
   echo "¹ÜÀíÔ±Ã»ÓÐµÇÂ¼,Çë<a href='AdminLogin.php'>µÇÂ¼</a>!";
   echo "</big></strong></font></p>";
   exit();
}*/
if(!isset($_GET[id])) {
   echo "<p align=center>";
   echo "<font color=#FF0000 size=5><strong><big>";
  // echo " <a href='$_'>µÇÂ¼</a>!";
   echo " id ²ÎÊý²»´æÔÚ, ´íÎó";
   echo "</big></strong></font></p>";
   exit();
}
?>

<script language="javascript"> 
    function checkadd()
    { 	
	
	[% FOREACH field IN fields%]
	
		if (form1.[%field%].value=="")
		{
			// Èç¹û[%field%]ÃûÎª¿Õ£¬ÔòÏÔÊ¾¾¯¸æÐÅÏ¢
	        alert("[%field%]²»ÄÜÎª¿Õ£¡");
			form1.[%field%].focus();
			return false;
	    }
	[%END%]		
		
								
		return true;

    }	
</script>

<body>
<?
  $db_host="localhost";   
  $db_user="root";   
  $db_password="passwordn";   
  $db_name="[%db%]";   
  mysql_connect($db_host,$db_user,$db_password);   
  mysql_select_db($db_name);   

	$sqldb=new db;
	$sqldb->connect_db("localhost", "root", "passwordn", "[%db%]");
  //´ÓÊý¾Ý¿âÖÐÈ¡µÃÊý¾Ý   
  //$query_string="select * from [%table%] order by content";   
  $query_string="select * from [%table%] where id=$_GET[id]; ";   
  echo $query_string;
  //$db_data=mysql_query($query_string);   
	$db_data=$sqldb->query($query_string);

  list( [%FOREACH field IN fields%] $[%field%], [%END%] ) = $sqldb->fetch_row($db_data);
  //list($id,$content,$main_menu,$sub_menu, $url)=mysql_fetch_row($db_data);
    
  echo var_dump($content);
?>
<table width="50%" border="0" cellspacing="1" cellpadding=3 align="center"> 
	<tr><td><a href="[%table%]_list.php"> [%db%]ÁÐ±í </a> </td></tr>
</table>
<form name="form1" method="post" action="[%table%]_modifyok.php" onSubmit="return checkadd()">
<!--<form name="form1" method="post" action="modifymenuok.php" onSubmit="return checkadd()"-->
  <table width="50%" border="0" cellspacing="1" cellpadding="3" align="center">
    <tr> 
      <th colspan="2">[%table%]ÐÞ¸Ä</th>
    </tr>
	
    [% FOREACH field IN fields%]

    <tr> 
      <td width="26%" align="right">[%field%] ÐÞ¸Ä£º</td>
      <td width="74%"> 
        <input name="[%field%]" type="text" value="<? echo $[%field%] ?> " size="50" maxlength="100">
      </td>
    </tr>
   [%END%]
    
    
    
    <tr> 
      <td width="26%" align="right"> 
        <input type="submit" name="Submit" value="Ìá½»">
      </td>
      <td width="74%"> 
        <input type="reset" name="Reset" value="ÖØÖÃ">
      </td>
    </tr>
  </table>
</form>


</body>
</html>
