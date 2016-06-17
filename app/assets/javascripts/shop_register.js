$(function(){
    lat = 35.1565645;
    lng = 136.9247428;
    
    
    
    // var map_options = {
    //     configure : {
    //       doubleClickZoom : true,
    //       scrollWheelZoom : true
    //     }
    // };
    // var ymap = new Y.Map("mapForm", map_options);
    // ymap.addControl(new Y.SliderZoomControlVertical());
    // ymap.addControl(new Y.LayerSetControl());
    // ymap.drawMap(new Y.LatLng(35.4661880,139.6227150 ), 17, Y.LayerSetId.NORMAL);

    // //マーカー
    // var marker = new Y.Marker(new Y.LatLng(35.4661880,139.6227150));
    // ymap.addFeature(marker);
    
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
    
    map.on('click', function(e){
        marker = onMapClick(e);
    });
});
    