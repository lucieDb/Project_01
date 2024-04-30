//Custom JS for map
class DiscoveredMap {
    constructor(map_data) {
        this.map_data = map_data;
        this.initializeMap();
    }

    initializeMap() {        
        var map = L.map('disco-map').setView([48.86666, 2.33333], 2);

        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '© OpenStreetMap contributors'
        }).addTo(map);

        Object.keys(this.map_data).forEach(key => {
            L.marker([this.map_data[key]['lat'], this.map_data[key]['lon']]).addTo(map)
                .bindPopup(key)
                .openPopup();
        })
    }
}
