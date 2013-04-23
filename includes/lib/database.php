<?php

class Database
{
	private $conn;
	private $server;
	private $error = NULL;
	private $errno = NULL;
	
	public function __construct($server)
	{
		$this->server = $server;
	}
	
	public function connect($user, $pass, $database)
	{
		$this->conn = mysql_connect($this->server, $user, $pass);
		if ($this->conn === FALSE)
		{
			$this->set_errors();
			return FALSE;
		}
		if (!mysql_select_db($this->conn, $database))
		{
			$this->set_errors();
			return FALSE;
		}
		return TRUE;
	}
	
	public function query($query)
	{
		return mysql_query($this->conn, $query);
	}
	
	public function get_result_array($result)
	{
		$formatted = array();
		while ($row = mysql_fetch_array($result, MYSQL_ASSOC))
		{
			$formatted[] = $row;
		}
		return $formatted;
	}
	
	public function get_affected()
	{
		return mysql_affected_rows($this->conn);
	}
	
	public function escape($str)
	{
		return mysql_real_escape_string($str, $this->conn);
	}
	
	public function close()
	{
		return mysql_close($this->conn);
	}
	
	public function get_error()
	{
		return $this->error;
	}
	
	public function get_errno()
	{
		return $this->errno;
	}
	
	private function set_errors()
	{
		$this->error = mysql_error($this->conn);
		$this->errno = mysql_error($this->conn);
	}
}

?>