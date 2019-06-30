<?php
class Login_model extends CI_Model{

  function validate($username,$password){
    $this->db->where('username',$username);
    $this->db->where('password',$password);
    $result = $this->db->get('user',1);
    return $result;
  }

  function getKerusakan(){
  	$a = $this->db->query("SELECT lat,lon,date_reported,user.username username,keterangan from laporan_kerusakan INNER JOIN user ON laporan_kerusakan.id_user = user.id ORDER BY laporan_kerusakan.id ASC");
  	return $a->result();
  }
}
