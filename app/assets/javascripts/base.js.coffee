jQuery ->
  $(document).ajaxSend (e, xhr, options) ->
    token = $("meta[name='csrf-token']").attr("content")
    xhr.setRequestHeader("X-CSRF-Token", token)
