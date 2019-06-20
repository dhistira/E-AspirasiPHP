<?php
class Page extends CI_Controller{
  function __construct(){
    parent::__construct();
    if($this->session->userdata('logged_in') !== TRUE){
      redirect('login');
    }
  }

  function index(){
      if($this->session->userdata('tipe')==='1'){
          $this->load->view('dashboard_view');
      }else{
          echo "Access Denied";
      }

  }

  function laporkan_kerusakan(){
      if($this->session->userdata('tipe')==='1'){
          $this->load->view('laporkan_kerusakan');
      }else{
          echo "Access Denied";
      }

  }

  function nilai_pelayanan(){
      if($this->session->userdata('tipe')==='1'){
          $this->load->view('nilai_pelayanan');
      }else{
          echo "Access Denied";
      }
  }

  function laporkan_kejahatan(){
    if($this->session->userdata('tipe')==='1'){
      $this->load->view('laporkan_kejahatan');
    } else {
      echo 'Access Denied';
    }
  }

}
