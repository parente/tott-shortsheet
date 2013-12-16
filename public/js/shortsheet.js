$(function() {
    // render 2D array representing CSV
    var render = function(csv) {
        var arr = $.csv.toArrays(csv);

        // clear out existing cells
        $('#sheet tbody').empty();
        $('#sheet thead').empty();

        var $thead = $('#sheet thead');
        var $tbody = $('#sheet tbody');
        // assume one header row in the csv
        var $tr = $('<tr>').appendTo($thead);
        $.each(arr[0], function(i, value) {
            $('<th>'+value+'</th>').appendTo($tr);
        });

        // create rows and cells for each row in the csv
        $.each(arr.slice(1), function(i, row) {
            $tr = $('<tr>').appendTo($tbody);
            $.each(row, function(j, value) {
                $('<td>'+value+'</td>').appendTo($tr);
            });
        });
    };

    // handle file input change event
    var on_file_change = function(event) {
        // was a file selected?
        var files = event.target.files;
        if(!files.length) return;
        // was it likely a csv file?
        var file = files[0];
        if(file.type !== 'text/csv') return;

        // read it and render
        var reader = new FileReader();
        reader.onload = function(event) {
            console.log(file.name, 'read');
            render(event.target.result);
        };
        reader.readAsText(file);
    };

    // TODO: register on_file_change as callback for 'change' events of
    // the file input element with id 'import-csv'

    // TODO: listen for double-click events on all cell elements to begin or
    // switch editing to another cell

    // TODO: listen for enter keypress on cells when in editing mode

    // load the example red wine quality dataset immediately
    $.get(STATIC_PATH+'/data/winequality-red.csv')
        .done(render)
        .fail(function() {
            console.error('failed to fetch sample data');
        });

    console.log('shortsheet.js loaded');
});