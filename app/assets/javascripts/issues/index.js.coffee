jQuery ->
  $('#issues').sortable {
    axis: 'y',
    containment: 'parent',
    items: 'li',
    opacity: 0.4,
    update: ->
      issues = $('#issues li')
      issue_ids = $.map issues, (issue) ->
        $(issue).attr('id').replace('issue_','')

      $.ajax {
        type: 'post',
        url: '/issues/prioritize',
        data: {issue_ids: issue_ids},
        dataType: 'script',
      }
  }
