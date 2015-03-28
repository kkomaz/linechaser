var geocoder;
var map;

function initialize() {
  geocoder = new google.maps.Geocoder(); //initiates a new geocode request
  var latlng = new google.maps.LatLng(40.7, -74.0);
  var mapOptions = {
    zoom: 12,
    center: latlng
  };
  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
}

function codeAddress() {
  var address = document.getElementById('address').value;
  //geocoder.geocode(input terms, callback function)
  geocoder.geocode( { 'address': address}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      map.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({ //creates a marker object
          map: map, //sets map
          position: results[0].geometry.location //sets position
      });
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
}



function finder(){
  $('#panel').on('click','#store_search', codeAddress);
}

$(function(){
    initialize();
    finder();
});
