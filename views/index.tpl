<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShortSheet</title>
    <link rel="stylesheet" href="{{static_path}}/vendor/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="{{static_path}}/css/shortsheet.css">
    <script src="{{static_path}}/vendor/jquery/jquery.min.js"></script>
    <script src="{{static_path}}/vendor/jquery-csv/src/jquery.csv.js"></script>
    <script src="{{static_path}}/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="{{static_path}}/js/shortsheet.js"></script>
    <script>var STATIC_PATH='{{static_path}}';</script>
  </head>
  <body>
    <nav class="navbar-fixed-top navbar navbar-default" role="navigation">
      
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">ShortSheet</a>
      </div>

      <div class="collapse navbar-collapse" id="navbar-collapse">
        <div style="position: relative;" class="navbar-btn navbar-right">
          <a class="btn btn-default" href="#">CSV Import
            <input type="file" class="btn file-input" id="import-csv" />
            &nbsp;
            <span class='label label-info' id="import-csv-info"></span>
          </a>
        </div>
      </div>

    </nav>
    <div class="table-responsive">
      <table id="sheet" class="table table-bordered">
        <thead></thead>
        <tbody></tbody>
      </table>
    </div>
  </body>
</html>
