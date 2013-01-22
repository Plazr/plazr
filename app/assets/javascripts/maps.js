$(document).ready(function() {

	var geocoder;
	var map;
	var oldMarker;

	function initialize() {
		geocoder = new google.maps.Geocoder();
		var latlng = new google.maps.LatLng(39.5, -8.3);
		var myOptions = {
			center: latlng,
			zoom: 6,
			mapTypeId: google.maps.MapTypeId.HYBRID,
			streetViewControl: false
		}
		map = new google.maps.Map(document.getElementById("mapa"), myOptions);
		placeMarker(latlng, 0);
	}

	function placeMarker(location, first) {

		var marker = new google.maps.Marker({
			position: location,
			map: map,
			animation: google.maps.Animation.DROP,
			draggable: true
		});

		if(first != 0){
			map.setZoom(16);
		}
		if (oldMarker != undefined){
			oldMarker.setMap(null);
		}
		oldMarker = marker;

		map.setCenter(location);


		var iw = new google.maps.InfoWindow({
			content: "A sua loja fica aqui!!!"
		});
		google.maps.event.addListener(marker, "click", function (e) { iw.open(map, marker); });

		google.maps.event.addListener(marker, 'drag', function(event){
			document.getElementById("store_latitude").value = event.latLng.lat();
			document.getElementById("store_longitude").value = event.latLng.lng();
		});
		google.maps.event.addListener(marker, 'click', toggleBounce);

	}

	function toggleBounce() {

		if (marker.getAnimation() != null) {
			marker.setAnimation(null);
		} else {
			marker.setAnimation(google.maps.Animation.BOUNCE);
		}
	}

	function codeAddress() {
		var address = document.getElementById("address").value;
		var city = document.getElementById("city").value;
		var codP1 =  document.getElementById("codP1").value;
		var codP2 =  document.getElementById("codP2").value;
		var location = address + ", " + city + ", " + codP1 + "-" + codP2;
		geocoder.geocode( { 'address': location}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				placeMarker(results[0].geometry.location, 1);
			} else {
				alert("A localização da sua loja não foi bem sucedida. Certifique-se que escreveu a morada corretamente.");
			}
		});
	}

	function codeLatLng() {
		var lat = parseFloat(document.getElementById("store_latitude").value);
		var lng = parseFloat(document.getElementById("store_longitude").value);
		var latlng = new google.maps.LatLng(lat, lng);
		geocoder.geocode({'latLng': latlng}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				if (results[1]) {
					placeMarker(latlng, 1);
				}
			} else {
				alert("A localização da sua loja não foi bem sucedida. Certifique-se que escreveu corretamente  a Latitude e Longitude.");
			}
		});
	}

	initialize();
});