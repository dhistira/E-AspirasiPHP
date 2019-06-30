<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>Laporkan Kejahatan - E-Aspirasi</title>

  <!-- General CSS Files -->
  <link rel="stylesheet" href="<?= base_url(); ?>assets/modules/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="<?= base_url(); ?>assets/modules/fontawesome/css/all.min.css">
  <link rel="stylesheet" href="<?= base_url(); ?>assets/modules/bootstrap-daterangepicker/daterangepicker.css">
  <link rel="stylesheet" href="<?= base_url(); ?>assets/modules/bootstrap-timepicker/css/bootstrap-timepicker.min.css">

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
          <?php $this->load->view('sidebar');?>
        </aside>
      </div>

      <!-- Main Content -->
      <div class="main-content">
        <form id="myForm" method="post" action="<?= base_url().'page/action_laporkan_kejahatan';?>" enctype='multipart/form-data'>
        <section class="section">
          <div class="section-header">
            <h1>Laporkan Kejahatan</h1>
          </div>

          <div class="section-body">
            <h2 class="section-title">Laporkan Kejahatan</h2>
            <p class="section-lead">
              Isi formulir berikut untuk melaporkan kejahatan
            </p>

            <div class="row">
              <?php if(isset($_GET['t'])){
                if($_GET['t'] == 'true'){
                  echo '<div class="alert alert-success">Berhasil! Data berhasil ditambah!</div>';
                } else {
                  echo '<div class="alert alert-danger">Oops! Terjadi masalah!</div>';
                }
              }?>
              <div class="col-6">
                <div class="card">
                  <div class="card-header">
                    <h4>Tandai Lokasi Kejahatan</h4>
                  </div>
                  <div class="card-body">
                    <div class="row mb-4">
                      <div class="col-md-10">
                        <div class="input-group">
                          <input type="text" class="form-control" id="input-lat" placeholder="Latitude" name="lat">
                          <input type="text" class="form-control" id="input-lng" placeholder="Longitude" name="lon">
                        </div>
                      </div>
                    </div>
                    <div id="map" data-height="400"></div>
                  </div>
                </div>
              </div>

              <div class="col-6">
                <div class="card">
                  <div class="card-header">
                    <h4>Isi Formulir Berikut</h4>
                  </div>
                  <div class="card-body">
                    <form id="myForm">
                      <div class="form-group">
                        <label>Tanggal & Waktu Kejadian</label>
                        <input type="text" class="form-control datetimepicker" name="datetimekejadian">
                      </div>
                      <div class="form-group">
                        <label>Jenis Kejahatan</label>
                        <select class="form-control" name="jeniskejahatan">
                          <option name="jeniskejahatan" value="pencurian">Pencurian</option>
                          <option name="jeniskejahatan" value="perampokan">Perampokan</option>
                          <option name="jeniskejahatan" value="pembunuhan">Pembunuhan</option>
                          <optio name="jeniskejahatan" value="menganggu ketertiban">Mengganggu Ketertiban</option>
                          <option name="jeniskejahatan" value="hipnotis">Hipnotis</option>
                          <option name="jeniskejahatan" value="Dll">Dll</option>
                        </select>
                      </div>
                      <div class="form-group">
                        <label class="form-label">Upload Foto Pendukung</label>
                        <div class="input-group">
                          <input type="file" name="image" class="btn btn-info">
                        </div>
                      </div>
                      <div class="form-group">
                        <button type="submit" class="btn btn-warning">Submit</button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </form>
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
  <script src="<?= base_url(); ?>assets/modules/bootstrap-daterangepicker/daterangepicker.js"></script>

  
  <!-- JS Libraies -->
  <script src="http://maps.google.com/maps/api/js?key=AIzaSyB55Np3_WsZwUQ9NS7DP-HnneleZLYZDNw&amp;sensor=true"></script>
  <script src="<?= base_url(); ?>assets/modules/gmaps.js"></script>

  <!-- Page Specific JS File -->
  <script src="<?= base_url(); ?>assets/js/page/gmaps-draggable-marker.js"></script>
  
  <!-- Template JS File -->
  <script src="<?= base_url(); ?>assets/js/scripts.js"></script>
  <script src="<?= base_url(); ?>assets/js/custom.js"></script>
  <script type="text/javascript" src="<?= base_url(); ?>webCodeCam/js/qrcodelib.js"></script>
  <script type="text/javascript" src="<?= base_url(); ?>webCodeCam/js/webcodecamjs.js"></script>
  <script type="text/javascript">
  function activeQR(){
    var txt = "innerText" in HTMLElement.prototype ? "innerText" : "textContent";
    var x = document.getElementById('idfasilitas');
    var arg = {
      resultFunction: function(result) {
        x.setAttribute("value",result.code);
      }
    };
    new WebCodeCamJS("canvas").init(arg).play();
  }
  </script>
</body>
</html>