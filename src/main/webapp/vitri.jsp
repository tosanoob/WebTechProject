<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="mytags" tagdir="/WEB-INF/tags/" %>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Beautiful Map</title>

<!-- Include Leaflet CSS -->
<link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />

<!-- Include Leaflet JavaScript -->
<script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>

<mytags:layout>
    <div id="map-container" style="height: 500px; width: 80%; margin: 20px auto; border: 1px solid #ccc; border-radius: 8px; overflow: hidden;">
        <div id="map-canvas" style="height: 100%;"></div>
    </div>
</mytags:layout>

<script>
    var map;

    function initialize() {
        // Create a Leaflet map centered at your desired location
        map = L.map('map-canvas').setView([16.07399621815195, 108.14991972350218], 20);

        // Add a beautiful base layer (e.g., OpenStreetMap)
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '&copy; OpenStreetMap contributors'
        }).addTo(map);
    }

    // Call the initialize function when the window has loaded
    window.onload = initialize;
</script>
