<apply template="base">

  <head>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.3/leaflet.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.3/leaflet.js"></script>
    <style>
      #map {
        height: 180px;
        border-radius: 6px;
        color: #333;
      }
    </style>
  </head>

  <div id="repeater">
    <div class="jumbotron ordb-jumbotron">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <h1 class="light">W8UPD/R</h1>
            <p>
              The University of Akron Amateur Radio Club
            </p>
          </div>
          <div class="col-md-6">
            <div id="map"></div>
            <script>
              var map = L.map('map').setView([41.195358, -81.393913], 13);
              L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
                attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
              }).addTo(map);
              var marker = L.marker([41.195358, -81.393913]).addTo(map);
              marker.bindPopup("Akron, OH, USA").openPopup();
            </script>
          </div>
        </div>
      </div>
    </div>

    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <h2>Transmit Sites</h2>
          <table class="table table-striped table-bordered">
            <tr>
              <th>Frequency</th>
              <th>Callsign</th>
              <th>Location</th>
              <th>CTCSS</th>
              <th>Height</th>
            </tr>
            <tr>
              <td>145.170 MHz</td>
              <td>W8UPD</td>
              <td>41.195358, -81.393913</td>
              <td>123.0 Hz</td>
              <td>1337 meters</td>
            </tr>
            <tr>
              <td>443.1125 MHz</td>
              <td>W8UPD</td>
              <td>41.195358, -81.393913</td>
              <td>131.8 Hz</td>
              <td>1337 meters</td>
            </tr>
          </table>
        </div>
        <div class="col-md-6">
          <h2>Receive Sites</h2>
          <table class="table table-striped table-bordered">
            <tr>
              <th>Frequency</th>
              <th>Location</th>
              <th>CTCSS</th>
              <th>Height</th>
            </tr>
            <tr>
              <td>144.570 MHz</td>
              <td>41.195328, -81.393913</td>
              <td>N/A</td>
              <td>1337 meters</td>
            </tr>
            <tr>
              <td>448.1125 MHz</td>
              <td>41.195358, -81.393913</td>
              <td>131.8 Hz</td>
              <td>1337 meters</td>
            </tr>
          </table>
        </div>
      </div>

      <hr />

      <div class="row">
        <div class="col-md-4">
          <h2>Capabilities</h2>
          <table class="table table-striped">
            <tr><td>Echolink</td></tr>
            <tr><td>Emergency power</td></tr>
            <tr><td>Full-time cross-band link</td></tr>
          </table>
        </div>
        <div class="col-md-4">
          <h2>Nets</h2>
          <table class="table table-striped">
            <tr>
              <th>Name</th>
              <th>When</th>
            </tr>
            <tr>
              <td>Experimenter's Net</td>
              <td>Weekly, Friday at 9pm</td>
            </tr>
          </table>
        </div>
        <div class="col-md-4">
          <h2>Public DTMF Codes</h2>
          <table class="table table-striped">
            <tr>
              <th>Name</th>
              <th>Code</th>
            </tr>
            <tr>
              <td>Echolink Connect</td>
              <td>D + node number</td>
            </tr>
            <tr>
              <td>Echolink Disconnect</td>
              <td>#</td>
            </tr>
          </table>
        </div>
      </div>
    </div>
  </div>
</apply>
