jQuery ->
  $('#issues').sortable {
    items: 'li',
    containment: 'parent',
    update: (event, ui) ->
      issues = $('#issues li')
      issue_ids = $.map issues, (issue) ->
        $(issue).attr('id').replace('issue_','')

      $.ajax {
        url: '/issues/prioritize',
        data: issue_ids,
        dataType: 'script',
        type: 'POST',
      }
  }
