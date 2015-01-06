# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->

  $('#navigate_to_trap').click (event) ->
    event.preventDefault()

    form = $(this).parents('form')
    trap_id = $('#trap_id_input').val()
    form.attr('action', "#{trap_id}/requests")
    form.submit()
