<?
//��ʼ��session
session_start();
#include ('head.php');
require ('dbconnect.php');
// ���û�е�¼���˳�
/*if(!isset($_SESSION['Adm'])) {
   echo "<p align=center>";
   echo "<font color=#FF0000 size=5><strong><big>";
   echo "����Աû�е�¼,��<a href='AdminLogin.php'>��¼</a>!";
   echo "</big></strong></font></p>";
   exit();
}*/

?>

<?
// �����һҳ���ݲ���
$main_menu=$_POST['main_menu'];
$sub_menu=$_POST['sub_menu'];
$content=$_POST['content'];

// ����Ƿ��Ѿ����ڸ���
// ��Ҫͬʱ����������������ߣ������磬���
$checksql="select * from menu where main_menu='$main_menu' and sub_menu='$sub_menu' and content='$content' ";
$checkresult=mysql_query($checksql,$conn);
$checkrow=mysql_fetch_array($checkresult);
if(!empty($checkrow)){
	// �����Ѿ���⣬�˳�����
	echo "<table width='100%' align=center><tr><td align=center>";
	echo "�ò˵��Ѿ���⣬��������<br>";
    echo "<font color=red>����ʧ�ܣ�</font><br><a href='addbook.php'>������</a>";
    echo "</td></tr></table>";
	exit();
}
// ����˳�����
//$sql="insert into menu(main_menu, sub_menu, content) values('$main_menu','$sub_menu','$content')";
//update user set password=password("new_pass") where user="root";
$sql="update menu set content='$content' where main_menu='$main_menu' and sub_menu='$sub_menu' ";
mysql_query($sql,$conn) or die("����ʧ�ܣ�".mysql_error());

// ���ע���û����Զ�id���Ժ�ʹ�ô�id�ſɵ�¼
$result=mysql_query("select last_insert_id()",$conn);
$re_arr=mysql_fetch_array($result);
$id=$re_arr[0];
echo "<table align=center><tr><td align=center>�˵��޸ĳɹ���</td></tr>";
echo "<tr><td align=center><font color=red>�ò˵��������ǣ�".$content."</font>";
echo "<br><a href='addbook.php'>��������²˵�</a></td></tr></table>";

?>
