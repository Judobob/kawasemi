$.fn.modal.Constructor::enforceFocus = ->
  modal_this = this
  $(document).on "focusin.modal", (e) ->
    modal_this.$element.focus()  if modal_this.$element[0] isnt e.target and not modal_this.$element.has(e.target).length and not $(e.target.parentNode).hasClass("cke_dialog_ui_input_select") and not $(e.target.parentNode).hasClass("cke_dialog_ui_input_text")
    return
  return