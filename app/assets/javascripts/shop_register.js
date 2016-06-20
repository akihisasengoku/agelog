$(function(){
    // central point of NIT
    lat = 35.1565645;
    lng = 136.9247428;
    
    // div#mapFormの時のみ
    if($('#mapForm').length){
        var	map	= L.map('mapForm').setView([lat, lng],	15);
        mapCreate(map);
        var marker;
        
        map.on('click', function(e){
            marker = onMapClick(e);
        });
    } else if ($('#mapEditForm').length) { //div#mapEditFormがある時、つまりedit画面の時
        var markerLatLng = $('#mapEditForm').data('latlng').split('_');
        var markerLat = markerLatLng[0]
        var markerLng = markerLatLng[1]
        
        var	map	= L.map('mapEditForm').setView([markerLat, markerLng], 17);
        mapCreate(map);
        var marker = inititalMarkerPlot();
        map.on('click', function(e){
            marker = onMapClick(e);
        });
    } else if ($('#userMap').length) { //div#userMapがある時、つまりusers/showの時
        var	map	= L.map('userMap').setView([lat, lng],	15);
        mapCreate(map);
        reviewedShopsMarkerPlot(map);
    } else if ($('#shopMap').length) {
        var	map	= L.map('shopMap').setView([lat, lng],	15);
        mapCreate(map);
        reviewedShopsMarkerPlot(map);
    }
    
    // create map
    function mapCreate(mapObj) {
        L.Icon.Default.imagePath	=	"/assets";
        var	osmUrl	= "http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png";
        var	osmAttrib	=	"Map	data	©	OpenStreetMap contributors";
        L.tileLayer(osmUrl,	{ attribution:	osmAttrib, maxZoom:	20, }).addTo(mapObj);
    }
    
    // plot current marker on edit page
    function inititalMarkerPlot() {
        var	initialMarker	= new L.marker([markerLat, markerLng], {draggable:'true'});
            
        initialMarker.on('dragend', function(e){
            //geocoding
            var marker = e.target;
            var position = marker.getLatLng();
            $('#latForm').val(position.lat);
            $('#lngForm').val(position.lng);
            marker.setLatLng(position,{draggable:'true'}).bindPopup(position).update();
        });
        initialMarker.addTo(map);
        return initialMarker;
    }
    
    // plot all shops already reviewed
    function reviewedShopsMarkerPlot(mapObj) {
        $('#wrapLatlngInfo').find('.latlngInfo').each(function() {
            var that = $(this);
            var	tmpMarker	= new L.marker([that.find('.latInfo').text(), that.find('.lngInfo').text()], {draggable:'true'});
            tmpMarker.addTo(mapObj);
        });
    }
    
    // delete the last marker and create a new marker on click point which have draggable action to update latlng
    function onMapClick(e) {
        if (!$.isEmptyObject(marker)) {
            map.removeLayer(marker);
        }
        lat = e.latlng.lat;
        lng = e.latlng.lng
        
        $('#latForm').val(lat);
        $('#lngForm').val(lng);
        var	tmpMarker	= new L.marker([lat, lng], {draggable:'true'});
        
        tmpMarker.on('dragend', function(e){
            var marker = e.target;
            var position = marker.getLatLng();
            $('#latForm').val(position.lat);
            $('#lngForm').val(position.lng);
            marker.setLatLng(position,{draggable:'true'}).bindPopup(position).update();
        });
        tmpMarker.addTo(map);
        
        return tmpMarker
    }
    
});
    