#!/usr/bin/perl
#20100201 
#还有连个问题， sql 语句最后哦一个字段没有逗号， 这里还有， 用的时候自己把他注释掉， 就可以了。 
#配合"/bin/mysql_backup.pl" 找出一个页面提交之后，连个快照， 比较一下，  涉及到的表， 就可以进行修改， 把WEB页面自动化， 导入了。 
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
my $passwd='password';
my $dsn="dbi:mysql:hostname=$host:port=$port:";
my $backup="/tmp/backup";
my $dbh= DBI->connect($dsn,$user,$passwd);
my %database;
my @fields ;
my $db=$ARGV[0];
my $table=$ARGV[1];
my $output;
$output="output/$db/".$table."_insert.pl";
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
	#     INCLUDE_PATH => 鈥�/search/path鈥�,  # or list ref
	     INTERPOLATE  => 1,		      # expand "$var" in plain text
	     POST_CHOMP	  => 1,		      # cleanup whitespace
	  # PRE_PROCESS  => 鈥檋eader鈥�,	      # prefix each template
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
	 
	 #my $input = 鈥檃.tpl鈥�;
	#my $input="template/table_insert.tpl";

	 # process input template, substituting variables
	 $template->process(\*DATA, $vars, $output )
	     || die $template->error();


