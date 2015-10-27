if [ -z $1 ] || [  -z $2 ]; then
echo Usage: $0 database table
exit -1;
fi;
echo "gen list"
./table_list_template.pl $1 $2
echo "gen_modify"
 ./table_modify_template.pl $1 $2 
echo "gen_modifyok"
./table_modifyok_template.pl $1 $2
cp db_pages.inc.php $1
cp qzj_db.php $1
#rm -r /var/www/html/$1
cp -a -r $1 /var/www/html
