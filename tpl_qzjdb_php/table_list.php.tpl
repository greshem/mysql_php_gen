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
$sqldb->connect_db("localhost", "root", "password","[% db %]");
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
while(list( [% FOREACH field IN fields %] $[% field %] ,[%END%] )=$sqldb->fetch_row())
{
	echo "<tr bgcolor=#ffffff >
				[%FOREACH field IN fields %] 
				<td>".substr($[%field%],0,64)."</td> 
				[%END%] <td><a href=[%table%]_modify.php?id=$id>编辑</a></td><td><a href=#>删除</a></td><tr>\n";


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
