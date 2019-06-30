<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>Dashboard - E-Aspirasi</title>

  <!-- General CSS Files -->
  <link rel="stylesheet" href="<?= base_url(); ?>assets/modules/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="<?= base_url(); ?>assets/modules/fontawesome/css/all.min.css">

  <!-- CSS Libraries -->

  <!-- Template CSS -->
  <link rel="stylesheet" href="<?= base_url(); ?>assets/css/style.css">
  <link rel="stylesheet" href="<?= base_url(); ?>assets/css/components.css">
<!-- Start GA -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-94034622-3"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-94034622-3');
</script>
<!-- /END GA --></head>

<body>
  <div id="app">
    <div class="main-wrapper main-wrapper-1">
      <div class="navbar-bg"></div>
      <nav class="navbar navbar-expand-lg main-navbar">
        <div class="form-inline mr-auto">
        </div>
        <ul class="navbar-nav navbar-right">
          <li class="dropdown"><a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg nav-link-user">
            <img alt="image" src="<?= base_url(); ?>assets/img/avatar/avatar-1.png" class="rounded-circle mr-1">
            <div class="d-sm-none d-lg-inline-block">Hi, <?= $this->session->userdata('username'); ?></div></a>
            <div class="dropdown-menu dropdown-menu-right">
              <a href="<?php echo site_url('login/logout');?>" class="dropdown-item has-icon text-danger">
                <i class="fas fa-sign-out-alt"></i> Logout
              </a>
            </div>
          </li>
        </ul>
      </nav>
      <div class="main-sidebar sidebar-style-2">
        <aside id="sidebar-wrapper">
          <?php $this->load->view('sidebar_admin');?>  
        </aside>
      </div>

      <!-- Main Content -->
      <div class="main-content">
        <section class="section">
          <div class="section-header">
            <h1>Dashboard</h1>
          </div>

          <div class="section-body">
            <h2 class="section-title">Laporan Terakhir</h2>
            <p class="section-lead">
              Berikut titik-titik laporan terakhir yang dilaporkan pada kami.
            </p>

            <div class="row">
              <div class="col-12">

              <?php if(isset($_GET['t'])){
                if($_GET['t'] == 'true'){
                  echo '<div class="alert alert-success">Berhasil! Data berhasil ditambah!</div>';
                } else {
                  echo '<div class="alert alert-danger">Oops! Terjadi masalah!</div>';
                }
              }?>
                <div class="card">
                  <div class="card-header">
                    <h4>Peta Laporan Terakhir</h4>
                  </div>
                  <div class="card-body">
                    <div id="map" data-height="400"></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
      <footer class="main-footer">
        <div class="footer-left">
          Copyright &copy; 2019 <div class="bullet"></div> E-Aspirasi</a>
        </div>
        <div class="footer-right">
          
        </div>
      </footer>
    </div>
  </div>

  <!-- General JS Scripts -->
  <script src="<?= base_url(); ?>assets/modules/jquery.min.js"></script>
  <script src="<?= base_url(); ?>assets/modules/popper.js"></script>
  <script src="<?= base_url(); ?>assets/modules/tooltip.js"></script>
  <script src="<?= base_url(); ?>assets/modules/bootstrap/js/bootstrap.min.js"></script>
  <script src="<?= base_url(); ?>assets/modules/nicescroll/jquery.nicescroll.min.js"></script>
  <script src="<?= base_url(); ?>assets/modules/moment.min.js"></script>
  <script src="<?= base_url(); ?>assets/js/stisla.js"></script>
  
  <!-- JS Libraies -->
  <script src="http://maps.google.com/maps/api/js?key=AIzaSyB55Np3_WsZwUQ9NS7DP-HnneleZLYZDNw&amp;sensor=true"></script>
  <script src="<?= base_url(); ?>assets/modules/gmaps.js"></script>

  <!-- Page Specific JS File -->
  <script>
    "use strict";

    // initialize map
    var map = new GMaps({
      div: '#map',
      lat: -7.5576139,
      lng: 110.8557427,
      zoom: 16
    });
    // Added markers to the map
    <?php foreach($a as $b){
    echo 'map.addMarker({
      lat: '.$b->lat.',
      lng: '.$b->lon.',
      title: "Laporan",
      infoWindow: {
        content: "<h6>Laporan Kerusakan</h6>'.$b->keterangan.'<hr>Laporan Dari <b>'.$b->username.'</b><br><small>Pada '.$b->date_reported.'</small>"
      }
    });';
    } ?>

    <?php foreach($c as $d){
    echo 'map.addMarker({
      lat: '.$d->lat.',
      lng: '.$d->lon.',
      title: "Kejahatan",
      infoWindow: {
        content: "<h6>Laporan Kejahatan</h6>'.$d->jenis_kejahatan.'<hr>Laporan Dari <b>'.$d->username.'</b><br><small>Pada '.$d->datetime_kejadian.'</small>"
      }
    });';
    } ?>

  </script>
  
  <!-- Template JS File -->
  <script src="<?= base_url(); ?>assets/js/scripts.js"></script>
  <script src="<?= base_url(); ?>assets/js/custom.js"></script>
</body>
</html>