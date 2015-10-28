<html>
<body>


<table  cellspacing=1 cellpadding=1  bgcolor=#aaaaaa width=800>
<?php 
include ("db_pages.inc.php");
include ("qzj_db.php");
$sqldb=new db;
$sqldb->connect_db("localhost", "root", "password","huanqiuweb");
$sqldb->query("select * from backuser_table");
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
$sqldb->query("select * from backuser_table limit $offset ,$onepage ");
echo "count =".$sqldb->get_count();
while(list(  $ba_id , $ba_name , $ba_password , $ba_truename , $fr_id , $ba_sta , $ba_date , )=$sqldb->fetch_row())
{
	echo "<tr bgcolor=#ffffff >
				 
				<td>$ba_id</td> 
				 
				<td>$ba_name</td> 
				 
				<td>$ba_password</td> 
				 
				<td>$ba_truename</td> 
				 
				<td>$fr_id</td> 
				 
				<td>$ba_sta</td> 
				 
				<td>$ba_date</td> 
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
