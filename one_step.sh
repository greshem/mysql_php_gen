if [ -z $1 ] || [  -z $2 ]; then
echo Usage: $0 database table
exit -1;
fi;
echo "gen list"
./table_list_template_v2.pl $1 $2
echo "gen_modify"
 ./table_modify_template_v2.pl $1 $2 
echo "gen_modifyok"
./table_modifyok_template_v2.pl  $1 $2
cp db_pages.inc.php output/$1
cp qzj_db.php output/$1
#rm -r /var/www/html/$1
cp -v  -a -r output/$1/*  /var/www/html/output/$1/
