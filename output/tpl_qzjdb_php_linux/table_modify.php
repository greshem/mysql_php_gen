<html>
<head>
<meta contentType="text/html" charset="GB2312">
</head>
<?
//初始化session
session_start();
//include ('head.php');
require ('qzj_db.php');
// 如果没有登录，退出
/*if(!isset($_SESSION['Adm'])) {
   echo "<p align=center>";
   echo "<font color=#FF0000 size=5><strong><big>";
   echo "管理员没有登录,请<a href='AdminLogin.php'>登录</a>!";
   echo "</big></strong></font></p>";
   exit();
}*/
if(!isset($_GET[id])) {
   echo "<p align=center>";
   echo "<font color=#FF0000 size=5><strong><big>";
  // echo " <a href='$_'>登录</a>!";
   echo " id 参数不存在, 错误";
   echo "</big></strong></font></p>";
   exit();
}
?>

<script language="javascript"> 
    function checkadd()
    { 	
	
	
	
		if (form1.ba_id.value=="")
		{
			// 如果ba_id名为空，则显示警告信息
	        alert("ba_id不能为空！");
			form1.ba_id.focus();
			return false;
	    }
	
	
		if (form1.ba_name.value=="")
		{
			// 如果ba_name名为空，则显示警告信息
	        alert("ba_name不能为空！");
			form1.ba_name.focus();
			return false;
	    }
	
	
		if (form1.ba_password.value=="")
		{
			// 如果ba_password名为空，则显示警告信息
	        alert("ba_password不能为空！");
			form1.ba_password.focus();
			return false;
	    }
	
	
		if (form1.ba_truename.value=="")
		{
			// 如果ba_truename名为空，则显示警告信息
	        alert("ba_truename不能为空！");
			form1.ba_truename.focus();
			return false;
	    }
	
	
		if (form1.fr_id.value=="")
		{
			// 如果fr_id名为空，则显示警告信息
	        alert("fr_id不能为空！");
			form1.fr_id.focus();
			return false;
	    }
	
	
		if (form1.ba_sta.value=="")
		{
			// 如果ba_sta名为空，则显示警告信息
	        alert("ba_sta不能为空！");
			form1.ba_sta.focus();
			return false;
	    }
	
	
		if (form1.ba_date.value=="")
		{
			// 如果ba_date名为空，则显示警告信息
	        alert("ba_date不能为空！");
			form1.ba_date.focus();
			return false;
	    }
			
		
								
		return true;

    }	
</script>

<body>
<?
  $db_host="localhost";   
  $db_user="root";   
  $db_password="password";   
  $db_name="huanqiuweb";   
  mysql_connect($db_host,$db_user,$db_password);   
  mysql_select_db($db_name);   

	$sqldb=new db;
	$sqldb->connect_db("localhost", "root", "password", "huanqiuweb");
  //从数据库中取得数据   
  //$query_string="select * from backuser_table order by content";   
  $query_string="select * from backuser_table where id=$_GET[id]; ";   
  echo $query_string;
  //$db_data=mysql_query($query_string);   
	$db_data=$sqldb->query($query_string);

  list(  $ba_id,  $ba_name,  $ba_password,  $ba_truename,  $fr_id,  $ba_sta,  $ba_date,  ) = $sqldb->fetch_row($db_data);
  //list($id,$content,$main_menu,$sub_menu, $url)=mysql_fetch_row($db_data);
    
  echo var_dump($content);
?>
<table width="50%" border="0" cellspacing="1" cellpadding=3 align="center"> 
	<tr><td><a href="backuser_table_list.php"> huanqiuweb列表 </a> </td></tr>
</table>
<form name="form1" method="post" action="backuser_table_modifyok.php" onSubmit="return checkadd()">
<!--<form name="form1" method="post" action="modifymenuok.php" onSubmit="return checkadd()"-->
  <table width="50%" border="0" cellspacing="1" cellpadding="3" align="center">
    <tr> 
      <th colspan="2">backuser_table修改</th>
    </tr>
	
    

    <tr> 
      <td width="26%" align="right">ba_id 修改：</td>
      <td width="74%"> 
        <input name="ba_id" type="text" value="<? echo $ba_id ?> " size="50" maxlength="100">
      </td>
    </tr>
   

    <tr> 
      <td width="26%" align="right">ba_name 修改：</td>
      <td width="74%"> 
        <input name="ba_name" type="text" value="<? echo $ba_name ?> " size="50" maxlength="100">
      </td>
    </tr>
   

    <tr> 
      <td width="26%" align="right">ba_password 修改：</td>
      <td width="74%"> 
        <input name="ba_password" type="text" value="<? echo $ba_password ?> " size="50" maxlength="100">
      </td>
    </tr>
   

    <tr> 
      <td width="26%" align="right">ba_truename 修改：</td>
      <td width="74%"> 
        <input name="ba_truename" type="text" value="<? echo $ba_truename ?> " size="50" maxlength="100">
      </td>
    </tr>
   

    <tr> 
      <td width="26%" align="right">fr_id 修改：</td>
      <td width="74%"> 
        <input name="fr_id" type="text" value="<? echo $fr_id ?> " size="50" maxlength="100">
      </td>
    </tr>
   

    <tr> 
      <td width="26%" align="right">ba_sta 修改：</td>
      <td width="74%"> 
        <input name="ba_sta" type="text" value="<? echo $ba_sta ?> " size="50" maxlength="100">
      </td>
    </tr>
   

    <tr> 
      <td width="26%" align="right">ba_date 修改：</td>
      <td width="74%"> 
        <input name="ba_date" type="text" value="<? echo $ba_date ?> " size="50" maxlength="100">
      </td>
    </tr>
   
    
    
    
    <tr> 
      <td width="26%" align="right"> 
        <input type="submit" name="Submit" value="提交">
      </td>
      <td width="74%"> 
        <input type="reset" name="Reset" value="重置">
      </td>
    </tr>
  </table>
</form>


</body>
</html>
