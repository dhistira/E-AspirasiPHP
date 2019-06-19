"use strict";

// initialize map
var map = new GMaps({
  div: '#map',
  lat: -7.5576139,
  lng: 110.8557427,
  zoom: 16
});
// Added markers to the map
map.addMarker({
  lat: -7.561463983006043,
  lng: 110.85771680583503,
  title: 'Laporan',
  infoWindow: {
    content: '<h6>Danau bocor</h6>Monmaap pak danau nya bocor<hr>Laporan Dari <b>Hakikid</b><br><small>3 Menit yang Lalu</small>'
  }
});
map.addMarker({
  lat: -7.558145681464203,
  lng: 110.85428357829596,
  title: 'Laporan',
  infoWindow: {
    content: '<h6>Halte Ilang</h6>Ebuset halte nya dimaling<hr>Laporan Dari <b>Mia Anandita</b><br><small>2 Minggu yang Lalu</small>'
  }
});
map.addMarker({
  lat: -7.556167451104505,
  lng: 110.85816741694953,
  title: 'Laporan',
  infoWindow: {
    content: '<h6>Stadion Pasir</h6>Ini ngapa stadion pasir semua da<hr>Laporan Dari <b>Pak Andi</b><br><small>1 Hari yang lalu</small>'
  }
});
