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

        let that = this;

        Object.keys(this.map_data).forEach(key => {
            let marker = L.marker([this.map_data[key]['coord']['lat'], this.map_data[key]['coord']['lon']]).addTo(map)
                .bindPopup(key);
            marker.on('click', function() {
                let cityName = key;
                let temp = that.map_data[key]['temp'];
                let feeling = that.map_data[key]['feeling'];
                let wind = that.map_data[key]['wind'];

                $("#info-city").html(`
                    <h2>${cityName}</h2>
                    <p>Temp : ${temp} °C</p>
                    <p>Feeling : ${feeling} °C</p>
                    <p>Wind speed : ${wind} km/h</p>
                `);
            });
        });
    };
};
