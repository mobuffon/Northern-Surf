var standingMarker=L.icon({iconUrl:"/assets/marker-1-8433e540b77957c68b53585eb0335ea3a08b7b34c15d9b456bb9e3d8a01c0f06.png",iconSize:[20,20],iconAnchor:[13,10],popupAnchor:[0,10]}),poolMarker=L.icon({iconUrl:"app/assets/images/marker-1.png",iconSize:[35,35],iconAnchor:[100,1e3],popupAnchor:[0,0]}),map=L.map("map").setView([53.805,10.3],6.8);L.tileLayer("https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=",{attribution:'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, Imagery \xa9 <a href="https://www.mapbox.com/">Mapbox</a>',maxZoom:18,id:"mapbox/streets-v11",tileSize:512,zoomOffset:-1,accessToken:"your.mapbox.access.token"}).addTo(map);