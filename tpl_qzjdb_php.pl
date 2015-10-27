#!/usr/bin/perl
use Template;

do("init_tpl_info.pl");

my $config = {
INTERPOLATE  => 1,		      # expand "$var" in plain text
POST_CHOMP	  => 1,		      # cleanup whitespace
EVAL_PERL	  => 1,		      # evaluate Perl code blocks
};

my $template = Template->new();
$Name=shift  or die("Usage: $0 Name\n");
#$Name="Netware";


$tpl_input_dir="tpl_qzjdb_php";
$tpl_output_dir="output/tpl_qzjdb_php"."_".$Name;

if ( ! -d   $tpl_output_dir)
{
	mkdir($tpl_output_dir);
}


$name="mysql";
$table="user";
@fields=get_tpl_para($name, $table);;
########################################################################
#Éú³É App
my $vars = {
db => $name,
table=>$table,
fields=> \@fields,
};
#$template->process($tpl_input_dir."/MyApp.tpl", $vars, "src_gen_frame/MyApp.cpp") || die $template->error();


$template->process($tpl_input_dir."/qzj_db.php.tpl", $vars, "$tpl_output_dir//qzj_db.php") || die $template->error();
$template->process($tpl_input_dir."/table_list.php.tpl", $vars, "$tpl_output_dir//table_list.php") || die $template->error();
$template->process($tpl_input_dir."/table_add.php.tpl", $vars, "$tpl_output_dir//table_add.php") || die $template->error();
$template->process($tpl_input_dir."/table_modifyok.php.tpl", $vars, "$tpl_output_dir//table_modifyok.php") || die $template->error();
$template->process($tpl_input_dir."/table_modify.php.tpl", $vars, "$tpl_output_dir//table_modify.php") || die $template->error();
$template->process($tpl_input_dir."/db_pages.inc.php.tpl", $vars, "$tpl_output_dir//db_pages.inc.php") || die $template->error();
