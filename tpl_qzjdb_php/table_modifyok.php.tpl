
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
// update ǰ���ǲ����� set id= ��, ��Ҫȥ��, ���ܴ�Ī���� ����, Ҳ��Ҫȥ��, 
//����where ��������id�� �����Ҫ��������id �﷨���ǲ���ȷ��, ������ˡ� 20091020 
//����Ķ��Ŵ������ 
//sed 's/set id=//g' ��ô��
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
	<tr><td><a href="[%table%]_list.php"> [%db%]�б�  </a> </td></tr>
</table>
	<table width="50%" border="1" cellspacing="1" cellpadding="3" align="center">
	<tr><td><a href=[%table%]_modify.php?id=<?php echo $id?> > �޸� </a> </td><td> ____ </td></tr>	
    [% FOREACH field IN fields%]

    <tr><td width="24%"> [%field%] </td> 
		<td width="76%"> 
		<?php echo 	$[%field%]   ?>
		</td>
    </tr>
   [%END%]"
    
    
    
  </table>
<?php
}
else
{
	echo "not  exists \n";
	echo mysql_error(),"\n";
}
?>
</html>
