
<html>

<head>
<meta contentType="text/html" charset="GB2312">
</head>
<?php
include ("qzj_db.php");


$ba_id=$_POST['ba_id'];

$ba_name=$_POST['ba_name'];

$ba_password=$_POST['ba_password'];

$ba_truename=$_POST['ba_truename'];

$fr_id=$_POST['fr_id'];

$ba_sta=$_POST['ba_sta'];

$ba_date=$_POST['ba_date'];


$sqldb=new db;
$sqldb->connect_db("localhost","root","passwordn", "huanqiuweb");
//$sqldb->query("select * from backuser_table where    and ba_id=$ba_id    and ba_name=$ba_name    and ba_password=$ba_password    and ba_truename=$ba_truename    and fr_id=$fr_id    and ba_sta=$ba_sta    and ba_date=$ba_date   ");
$sqldb->query("select * from  backuser_table where id=$id");

if($sqldb->fetch_row())
{
// update ǰ���ǲ����� set id= ��, ��Ҫȥ��, ���ܴ�Ī���� ����, Ҳ��Ҫȥ��, 
//����where ��������id�� �����Ҫ��������id �﷨���ǲ���ȷ��, ������ˡ� 20091020 
//����Ķ��Ŵ������ 
//sed 's/set id=//g' ��ô��
	$sqldb->query("update backuser_table set  
				 
				
			,	ba_id='$ba_id'      
				
			,	ba_name='$ba_name'      
				
			,	ba_password='$ba_password'      
				
			,	ba_truename='$ba_truename'      
				
			,	fr_id='$fr_id'      
				
			,	ba_sta='$ba_sta'      
				
			,	ba_date='$ba_date'       
				where id=$id ");
	echo mysql_error(),"\n";
	echo "success\n";

  $query_string="select * from backuser_table where id=$_POST[id]; ";   
	$db_data=$sqldb->query($query_string);
  list(  $ba_id,  $ba_name,  $ba_password,  $ba_truename,  $fr_id,  $ba_sta,  $ba_date,  ) = $sqldb->fetch_row($db_data);
?>
<table width="50%" border="0" cellspacing="1" cellpadding=3 align="center"> 
	<tr><td><a href="backuser_table_list.php"> huanqiuweb�б�  </a> </td></tr>
</table>
	<table width="50%" border="1" cellspacing="1" cellpadding="3" align="center">
	<tr><td><a href=backuser_table_modify.php?id=<? echo $id?> > �޸� </a> </td><td> ____ </td></tr>	
    

    <tr><td width="24%"> ba_id </td> 
		<td width="76%"> 
		<?echo 	$ba_id   ?>
		</td>
    </tr>
   

    <tr><td width="24%"> ba_name </td> 
		<td width="76%"> 
		<?echo 	$ba_name   ?>
		</td>
    </tr>
   

    <tr><td width="24%"> ba_password </td> 
		<td width="76%"> 
		<?echo 	$ba_password   ?>
		</td>
    </tr>
   

    <tr><td width="24%"> ba_truename </td> 
		<td width="76%"> 
		<?echo 	$ba_truename   ?>
		</td>
    </tr>
   

    <tr><td width="24%"> fr_id </td> 
		<td width="76%"> 
		<?echo 	$fr_id   ?>
		</td>
    </tr>
   

    <tr><td width="24%"> ba_sta </td> 
		<td width="76%"> 
		<?echo 	$ba_sta   ?>
		</td>
    </tr>
   

    <tr><td width="24%"> ba_date </td> 
		<td width="76%"> 
		<?echo 	$ba_date   ?>
		</td>
    </tr>
   "
    
    
    
  </table>
<?
}
else
{
	echo "not  exists \n";
	echo mysql_error(),"\n";
}
?>
</html>
