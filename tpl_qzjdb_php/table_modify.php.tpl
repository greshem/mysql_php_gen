<html>
<head>
<meta contentType="text/html" charset="GB2312">
</head>
<?php
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
   echo " id 参数不存在, 错误, may be not exists in  mysql schema ";
   echo "</big></strong></font></p>";
   exit();
}
?>

<script language="javascript"> 
    function checkadd()
    { 	
	
	[% FOREACH field IN fields%]
	
		if (form1.[%field%].value=="")
		{
			// 如果[%field%]名为空，则显示警告信息
	        alert("[%field%]不能为空！");
			form1.[%field%].focus();
			return false;
	    }
	[%END%]		
		
								
		return true;

    }	
</script>

<body>
<?php
  $db_host="localhost";   
  $db_user="root";   
  $db_password="qianqian";   
  $db_name="[%db%]";   
  mysql_connect($db_host,$db_user,$db_password);   
  mysql_select_db($db_name);   

	$sqldb=new db;
	$sqldb->connect_db("localhost", "root", "qianqian", "[%db%]");
  //从数据库中取得数据   
  //$query_string="select * from [%table%] order by content";   
  $query_string="select * from [%table%] where id=$_GET[id]; ";   
  echo $query_string;
  //$db_data=mysql_query($query_string);   
	$db_data=$sqldb->query($query_string);

  list( [%FOREACH field IN fields%] $[%field%], [%END%] ) = $sqldb->fetch_row($db_data);
  //list($id,$content,$main_menu,$sub_menu, $url)=mysql_fetch_row($db_data);
    
  echo var_dump($content);
?>
<table width="50%" border="0" cellspacing="1" cellpadding=3 align="center"> 
	<tr><td><a href="[%table%]_list.php"> [%db%]列表 </a> </td></tr>
</table>
<form name="form1" method="post" action="[%table%]_modifyok.php" onSubmit="return checkadd()">
<!--<form name="form1" method="post" action="modifymenuok.php" onSubmit="return checkadd()"-->
  <table width="50%" border="0" cellspacing="1" cellpadding="3" align="center">
    <tr> 
      <th colspan="2">[%table%]修改</th>
    </tr>
	
    [% FOREACH field IN fields%]

    <tr> 
      <td width="26%" align="right">[%field%] 修改：</td>
      <td width="74%"> 
        <input name="[%field%]" type="text" value="<?php echo $[%field%] ?> " size="50" maxlength="100">
      </td>
    </tr>
   [%END%]
    
    
    
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
