<?php
class Page extends CI_Controller{
  function __construct(){
    parent::__construct();
    if($this->session->userdata('logged_in') !== TRUE){
      redirect('login');
    }
    $this->load->model('Login_model');
  }

  function index(){
      if($this->session->userdata('tipe')==='1'){
          $data['a'] = $this->Login_model->getKerusakan();
          $data['c'] = $this->Login_model->getKejahatan();
          $this->load->view('dashboard_view',$data);
      }else{
          echo "Access Denied";
      }

  }


  //////////////////////////////////////////////////
  ////                                          ////
  ////          LAPORKAN KERUSAKAN              ////
  ////                                          ////
  //////////////////////////////////////////////////

  function laporkan_kerusakan(){
      if($this->session->userdata('tipe')==='1'){
          $this->load->view('laporkan_kerusakan');
      }else{
          echo "Access Denied";
      }

  }

  function action_laporkan_kerusakan(){
      if($this->session->userdata('tipe') === '1'){
          $iduser = $this->session->userdata('id');
          $lat = $this->input->post('lat');
          $lon = $this->input->post('lon');
          $foto = $this->uploadImage();
          $a = $this->db->insert('laporan_kerusakan',
            array(
              'id_user' => $iduser,
              'tipe' => $this->input->post('tipefasilitas'),
              'id_fasilitas' => $this->input->post('idfasilitas'),
              'id_statusInfrastruktur' => $this->input->post('statusfasilitas'),
              'date_reported' => date("Y-m-d h:i:s"),
              'date_modified' => date("Y-m-d h:i:s"),
              'id_statusLaporan' => 1,
              'foto' => null,
              'lat' => $lat,
              'lon' => $lon,
              'foto' => $foto,
              'keterangan' => $this->input->post('keteranganFasilitas')
            ));

          if($a){
            redirect(base_url().'page/index?t=true');
          } else {
            redirect(base_url().'page/index?t=false');
          }
      } else {
        echo "Access Denied";
      }
  }


  //////////////////////////////////////////////////
  ////                                          ////
  ////             NILAI PELAYANAN              ////
  ////                                          ////
  //////////////////////////////////////////////////
  
  function nilai_pelayanan(){
      if($this->session->userdata('tipe')==='1'){
          $this->load->view('nilai_pelayanan');
      }else{
          echo "Access Denied";
      }
  }

  function action_laporkan_pelayanan(){
      if($this->session->userdata('tipe') === '1'){
          $iduser = $this->session->userdata('id');
          $a = $this->db->insert('laporan_pelayanan',
            array(
              'id_user' => $iduser,
              'id_staffPelayanan' => $this->input->post('idstaff'),
              'datetime_pelayanan' => $this->input->post('datetimepelayanan'),
              'nilai' => $this->input->post('nilai'),
              'keterangan' => $this->input->post('keterangan'),
              'date_created' => date("Y-m-d h:i:s"),
              'date_modified' => date("Y-m-d h:i:s"),
              'id_statusPelayanan' => '1'
            ));

          if($a){
            redirect(base_url().'page/index?t=true');
          } else {
            redirect(base_url().'page/index?t=false');
          }
      } else {
        echo "Access Denied";
      }
  }

  //////////////////////////////////////////////////
  ////                                          ////
  ////          LAPORKAN KEJAHATAN              ////
  ////                                          ////
  //////////////////////////////////////////////////

  function laporkan_kejahatan(){
    if($this->session->userdata('tipe')==='1'){
      $this->load->view('laporkan_kejahatan',$data);
    } else {
      echo 'Access Denied';
    }
  }

  function action_laporkan_kejahatan(){
      if($this->session->userdata('tipe') === '1'){
          $iduser = $this->session->userdata('id');
          $foto = $this->uploadImage();
          $a = $this->db->insert('laporan_keamanan',
            array(
              'id_user' => $iduser,
              'datetime_kejadian' => $this->input->post('datetimekejadian'),
              'jenis_kejahatan' => $this->input->post('jeniskejahatan'),
              'date_created' => date("Y-m-d h:i:s"),
              'lat' => $this->input->post('lat'),
              'lon' => $this->input->post('lon'),
              'foto' => $foto,
              'id_statusKeamanan' => '1'
            ));

          if($a){
            redirect(base_url().'page/index?t=true');
          } else {
            redirect(base_url().'page/index?t=false');
          }
      } else {
        echo "Access Denied";
      }
  }

  //////////////////////////////////////////////////
  ////                                          ////
  ////                UTILITIES                 ////
  ////                                          ////
  //////////////////////////////////////////////////

  private function uploadImage()
  {
      $config['upload_path']          = FCPATH . '/tubespemwebok/uploads/';
      $config['allowed_types']        = 'gif|jpg|png';
      $config['file_name']            = date("Ymdhis");
      $config['overwrite']      = true;
      $config['max_size']             = 1024; // 1MB
      // $config['max_width']            = 1024;
      // $config['max_height']           = 768;

      $this->load->library('upload', $config);

      if ($this->upload->do_upload('image')) {
          return $this->upload->data("file_name");
      } else {
        return "default.jpg";
      }
  }

}
