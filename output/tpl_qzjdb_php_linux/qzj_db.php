<?php 
class db {

var $conn;
//var $res;
var $db_res;
var $count;
	function connect_db($host, $user, $passwd,$db)
	{
		$this->conn=mysql_connect($host, $user, $passwd) or die("connect error\n");
		if ($this->conn)
		{
			$db_res=mysql_select_db($db, $this->conn);
			return $db_res;
		}
		else
		{
			return false;
		}
	}

	function query($query)
	{
		$this->db_res=mysql_query($query);
		if(mysql_affected_rows() > 0)
		{
			return $this->db_res;
		}
		else
		{
			return false;
		}
	}
	function fetch_row()
	{
		$res=mysql_fetch_row($this->db_res);
		return $res;
	}
	function get_count()
	{
		return mysql_affected_rows();
	}
}

?>
