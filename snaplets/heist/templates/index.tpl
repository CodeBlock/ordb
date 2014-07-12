<apply template="base">
  <head>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.3/leaflet.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.3/leaflet.js"></script>
    <style>
      #map {
        position: fixed;
        height: 100%;
        width: 100%;
        opacity: 0.15;
      }
      .jumbotron {
        background: transparent !important;
      }
    </style>

    <script>
      $(function() {
        $('#map').height($('.ordb-intro').outerHeight(true));
        var map = L.map('map', {
          dragging: false,
          touchZoom: false,
          scrollWheelZoom: false,
          doubleClickZoom: false,
          boxZoom: false,
          zoomControl: false
        }).setView([41.195358, -81.393913], 13);
        L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
          attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
        }).addTo(map);
      });
    </script>

  </head>

  <div id="index">
    <div id="map"></div>
    <div class="jumbotron ordb-intro">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <h1 class="light">OpenRDB</h1>
            <p>
              A sleek repeater directory that anyone can edit.
            </p>
          </div>
          <div class="col-md-6">
            <form class="form-horizontal" role="form">
              <div class="form-group">
                <h2>
                  Find repeaters near you:
                </h2>
              </div>
              <div class="form-group">
                <input class="form-control input-lg" type="text" placeholder="Your location..." />
              </div>
              <div class="form-group">
                <input class="btn btn-primary pull-right" type="submit" value="Search" />
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>

    <hr />

    <div class="container">

      <div class="row">
        <div class="col-md-4">
          <h2>Freedom.</h2>
          <p class="text-justify">
            Free in every sense of the word. Our database is available under the
            <a href="http://opendatacommons.org/licenses/odbl/1.0/">Open Database License</a>
            openly available to all developers.
          </p>
        </div>
        <div class="col-md-4">
          <h2>Data rich.</h2>
          <p class="text-justify">
            Detailed information on repeaters provided by the community. Our
            database is constantly updated to reflect the changes that are
            happening, as reported by the community.
          </p>
        </div>
        <div class="col-md-4">
          <h2>User friendly.</h2>
          <p class="text-justify">
            Modern, attractive, and easy-to-use, OpenRDB facilitates the
            progression of the amateur radio service.
          </p>
        </div>
      </div>
    </div>
  </div>
</apply>
