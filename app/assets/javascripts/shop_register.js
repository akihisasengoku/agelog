$(function(){
    lat = 35.1565645;
    lng = 136.9247428;
    L.Icon.Default.imagePath	=	"/assets";
    var	map	= L.map('mapForm').setView([lat, lng],	15);
    var	osmUrl	= "http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png";
    var	osmAttrib	=	"Map	data	©	OpenStreetMap contributors";
    L.tileLayer(osmUrl,	{ attribution:	osmAttrib, maxZoom:	20, }).addTo(map);
    
    var marker;
    
    
    function onMapClick(e) {
        if (!$.isEmptyObject(marker)) {
            map.removeLayer(marker);
        }
        lat = e.latlng.lat;
        lng = e.latlng.lng
        
        $('#latForm').val(lat);
        $('#lngForm').val(lng);
        var	tmpMarker	= new L.marker([lat, lng], {draggable:'true'});
        // tmpMarker.on('dragend', function(event){
        //     var marker = event.target;
        //     var position = marker.getLatLng();
        //     alert(position);
        //     marker.setLatLng([position],{id:uni,draggable:'true'}).bindPopup(position).update();
        // });
        
        tmpMarker.on('dragend', function(e){
            var marker = e.target;
            var position = marker.getLatLng();
            $('#latForm').val(position.lat);
            $('#lngForm').val(position.lng);
            marker.setLatLng(position,{draggable:'true'}).bindPopup(position).update();
        });
        // map.addLayer(marker);
        tmpMarker.addTo(map);
        
        return tmpMarker
    }
    
    map.on('click', function(e){
        marker = onMapClick(e);
        // marker.on('dragover', function(event){
        //     var marker = event.target;
        //     var position = marker.getLatLng();
        //     alert(position);
        //     marker.setLatLng([position],{id:uni,draggable:'true'}).bindPopup(position).update();
        // });
    });
});
    