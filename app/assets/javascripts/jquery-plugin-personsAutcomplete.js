(function( $ ) {
    jQuery.fn.usersAutocomplete = function(options) {

        var settings = {
            'url':        '/users/',
            'loader_class': '.loader',
        };

        return this.each(function() {

            // override the settings if specified
            if ( options ) {
                $.extend( settings, options );
            }

            // put jquery ui autocompletion on given element
            $(this).autocomplete({
                source: searchUsers,
                autoFocus: true,
                delay: 300,
                select: function(event, ui) {
                    window.location = settings.url + ui.item.value
                    return false;
                }
            })

            // make an ajax call to search for the person
            function searchUsers( request, response) {
                request = $.ajax({
                    url: settings.url + 'search.json',
                    data: { user_name : request.term},
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
