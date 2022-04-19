var latitude = document.currentScript.getAttribute('latitude')
var longitude = document.currentScript.getAttribute('longitude')
var hans = document.currentScript.getAttribute('hans')
var hans = document.currentScript.getAttribute('hans')

if (latitude && longitude){
  // console.log(latitude)
  // console.log(longitude)
  // console.log(hans)
  var marker = L.marker([latitude, longitude], {icon: standingMarker}).addTo(map);
  marker.bindPopup(`<p><b>${hans}</b></p>`);
}
