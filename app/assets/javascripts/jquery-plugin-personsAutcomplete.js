(function( $ ) {
    jQuery.fn.personsAutocomplete = function(options) {

        var settings = {
            'url':        '/persons/',
            'loader_class': '.loader',
        };

        return this.each(function() {

            // override the settings if specified
            if ( options ) {
                $.extend( settings, options );
            }

            // put jquery ui autocompletion on given element
            $(this).autocomplete({
                source: searchPerson,
                autoFocus: true,
                delay: 300,
                select: function(event, ui) {
                    window.location = settings.url + ui.item.value
                    return false;
                }
            })

            // make an ajax call to search for the person
            function searchPerson( request, response) {
                request = $.ajax({
                    url: '/persons/search.json',
                    data: { person_name : request.term},
                    beforeSend: showLoader,
                    success: function (data) {
                        response( $.map( data, createItem));
                    }
                })
            }

            // create an item object that jquery-ui autocompletion can handle
            function createItem(item) {
                return {
                    label: item.name,
                    value: item._id
                }
            }

            // show a loader on the input field
            function showLoader() {
                $(this).addClass('loader');
            }

            // hide the loader on the input field
            function hideLoader() {
                $(this).removeClass('loader');
            }

        });
    }; // end of function

})( jQuery );
