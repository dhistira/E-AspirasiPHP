<?php
class Login_model extends CI_Model{

  function validate($username,$password){
    $this->db->where('username',$username);
    $this->db->where('password',$password);
    $result = $this->db->get('user',1);
    return $result;
  }

  function getKerusakan(){
  	$a = $this->db->query("SELECT laporan_kerusakan.id id,lat,lon,date_reported,user.username username,keterangan,status_infrastruktur.nama statusinfrastruktur,laporan_kerusakan.id_statusLaporan idstatuslaporan, status_laporan.nama statuslaporan from laporan_kerusakan INNER JOIN user ON laporan_kerusakan.id_user = user.id JOIN status_infrastruktur ON laporan_kerusakan.id_statusInfrastruktur = status_infrastruktur.id JOIN status_laporan ON laporan_kerusakan.id_statusLaporan = status_laporan.id ORDER BY laporan_kerusakan.id ASC");
  	return $a->result();
  }

  function getKejahatan(){
  	$a = $this->db->query("SELECT laporan_keamanan.id idlaporankeamanan,lat,lon,datetime_kejadian,user.username username,jenis_kejahatan,laporan_keamanan.date_created date_created,status_keamanan.nama statuskejahatan, status_keamanan.id idstatuskejahatan from laporan_keamanan INNER JOIN user ON laporan_keamanan.id_user = user.id JOIN status_keamanan ON laporan_keamanan.id_statusKeamanan = status_keamanan.id ORDER BY laporan_keamanan.id ASC");
  	return $a->result();
  }

  function getPelayanan(){
    $a = $this->db->query("SELECT laporan_pelayanan.*, user.username username from laporan_pelayanan INNER JOIN user ON laporan_pelayanan.id_user = user.id ORDER BY id ASC");
    return $a->result();
  }
}
