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
				 
				<td>".substr($ba_id,0,64)."</td> 
				 
				<td>".substr($ba_name,0,64)."</td> 
				 
				<td>".substr($ba_password,0,64)."</td> 
				 
				<td>".substr($ba_truename,0,64)."</td> 
				 
				<td>".substr($fr_id,0,64)."</td> 
				 
				<td>".substr($ba_sta,0,64)."</td> 
				 
				<td>".substr($ba_date,0,64)."</td> 
				 <td><a href=backuser_table_modify.php?id=$ba_id>编辑</a></td><td><a href=#>删除</a></td><tr>\n";


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
