<html>
<body>


<table  cellspacing=1 cellpadding=1  bgcolor=#aaaaaa width=800>
<?php 
include ("db_pages.inc.php");
include ("qzj_db.php");
$sqldb=new db;
$sqldb->connect_db("localhost", "root", "password","test");
$sqldb->query("select * from menu");
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
$sqldb->query("select * from menu limit $offset ,$onepage ");
echo "count =".$sqldb->get_count();
while(list(  $id , $content , $main_menu , $sub_menu , $url , )=$sqldb->fetch_row())
{
	echo "<tr bgcolor=#ffffff >
				 
				<td>$id</td> 
				 
				<td>$content</td> 
				 
				<td>$main_menu</td> 
				 
				<td>$sub_menu</td> 
				 
				<td>$url</td> 
				<tr>\n";


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
