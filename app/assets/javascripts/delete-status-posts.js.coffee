jQuery ($) ->

  # Assign to $ to jquery to resolve eventual naming conflicts
  $ = jQuery

  # Reserve a namespace
  $.fn.extend
    setDeletableStatusPosts: (options) ->

      # Default settings
      settings =
        delete_button_selector: '.destroy'

      # Merge default settings with options.
      settings = $.extend settings, options

      # Bind to delete button
      # @param element the delete button
      initialize_delete_link_on = (element) ->
        delete_button = element.find settings.delete_button_selector

        delete_button.bind 'click', (event) =>
          delete_post delete_button
          false

      # Delete a post and fadeout en remove the corresponding post
      # @param element the delete button
      delete_post = (element) ->
        url = element.attr('href') + '.json'
        call = make_ajax_call url

        call.complete (response) =>
          post = element.parent()
          post.fadeOut () => post.remove()

      # Do an ajax call and return the xhrObject
      # @param url the ajax url
      make_ajax_call = (url) ->
        call = $.ajax url, type: 'DELETE'

      # bind the events to the links
      return @each (index, element)->
        initialize_delete_link_on $(element)




