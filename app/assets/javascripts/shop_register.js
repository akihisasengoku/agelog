$(function(){
    // central point of NIT
    lat = 35.1565645;
    lng = 136.9247428;
    var options = {
        scrollWheelZoom: false,
        touchZoom: false,
        tap: false
    };

    // div#mapFormの時のみ
    if($('#mapForm').length){
        var	map	= L.map('mapForm', options).setView([lat, lng], 15);
        mapCreate(map);
        var marker;
        
        map.on('click', function(e){
            marker = onMapClick(e);
        });
    } else if ($('#mapEditForm').length) { //div#mapEditFormがある時、つまりedit画面の時
        var markerLatLng = $('#mapEditForm').data('latlng').split('_');
        var markerLat = markerLatLng[0]
        var markerLng = markerLatLng[1]
        
        var	map	= L.map('mapEditForm', options).setView([markerLat, markerLng], 17);
        mapCreate(map);
        var marker = inititalMarkerPlot();
        map.on('click', function(e){
            marker = onMapClick(e);
        });
    } else if ($('#userMap').length) { //div#userMapがある時、つまりusers/showの時
        var	map	= L.map('userMap', options).setView([lat, lng], 15);;
        mapCreate(map);
        reviewedShopsMarkerPlot(map);
    } else if ($('#shopMap').length) {
        var	map	= L.map('shopMap', options).setView([lat, lng], 15);
        mapCreate(map);
        reviewedShopsMarkerPlot(map);
    } else if ($('#areaMap').length) {
        var areaName = $('#areaName').text(); // get area name
        var latlngZoom = getAreaLatlngzoom(areaName);
        var	map	= L.map('areaMap', options).setView([latlngZoom[0], latlngZoom[1]],	latlngZoom[2]);
        mapCreate(map);
        
        areaHavingShopsMarkerPlot(map);
    }
    
    // get area's lat lng zoomSize [lat, lng, zoomSize]
    function getAreaLatlngzoom(areaName) {
        if (areaName == "全体") {
            return [lat, lng, 15];
        } else if (areaName == "鶴舞") {
            return [35.156889,136.91554, 17];
        } else if (areaName == "吹上") {
            return [35.1570039, 136.9320468, 16];
        } else if (areaName == "御器所") {
            return [35.1527483, 136.9294969, 16];
        } else if (areaName == "千種") {
            return [35.161368, 136.9222794, 16];
        }
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
    
    // Plot all shops already reviewed
    function reviewedShopsMarkerPlot(mapObj) {
        $('#wrapLatlngInfo').find('.latlngInfo').each(function() {
            var that = $(this);
            var	tmpMarker	= new L.marker([that.find('.latInfo').text(), that.find('.lngInfo').text()]);
            tmpMarker.addTo(mapObj);
        });
    }
    
    // Show shops related to areas on the area/show map
    function areaHavingShopsMarkerPlot(mapObj) {
        var shopTotalNum = parseInt($('#shopTotalNum').text());
        for (var i=0; i < shopTotalNum; i++){
            var latInfoId = '#latInfo-' + i;
            var lngInfoId = '#lngInfo-' + i;
            var shopNameId = '#shopNameInfo-' + i;
            var shopAgeCount =  '#shopAgeCount-' + i;
            var shopCategoryInfo = '#shopCategoryInfo-' + i;
            
            
            var	tmpMarker	= new L.marker([$(latInfoId).text(), $(lngInfoId).text()]);
            
            var shopName = $(shopNameId).text();
            var ageNum = $(shopAgeCount).text();
            var shopCategoryTotalNumId = '#shopCategoryTotalNum-' + i;
            var shopCategoryTotalNum = parseInt($(shopCategoryTotalNumId).text());
            
            var html = '<div class="wrapPopup"><div class="popupShopName">' + shopName + ' | ' + ageNum + '</div>';
            if (shopCategoryTotalNum > 0) {
                var $shopCategoryInfo = $(shopCategoryInfo);
                html += '<p>ジャンル：</p><ul class="list-inline">';
                for (var j=0; j < shopCategoryTotalNum; j++) {
                    var categoryName = '#categoryName-' + j;
                    html += '<li>' + $shopCategoryInfo.find(categoryName).text() + '</li>';
                }
                html += '</ul>';
            }
            
            html += '</div>'
            
            tmpMarker.bindPopup(html).addTo(mapObj);
        }
        $('#wrapShopsInfo').find('.latlngInfo').each(function(i) {
            var that = $(this);
            var latInfoId = '#latInfo-' + i;
            var lngInfoId = '#lngInfo-' + i;
            var shopNameId = '#shopNameInfo-' + i;
            var	tmpMarker	= new L.marker([that.find(latInfoId).text(), that.find(lngInfoId).text()]);
            tmpMarker.on('click', function() {
               var shopName = that.find('.')
            });
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
    