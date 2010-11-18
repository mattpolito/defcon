$(function(){
  $("#sortable_issues").sortable({
    items:'.issues', 
    containment:'parent', 
    axis:'y', 
    update: function() {
      var el    = $(this);
      var issue_id = [];
      
      $("#sortable_issues").children().each(function(index) {
        // console.log($(this).children("span").attr("data-issue_id"))
        issue_id.push($(this).children("span").attr("data-issue_id"))
      });
      
      var data = {issue_ids : issue_id}

      $.ajax({
            url:  "/issues/prioritize",
            data: data,
            dataType: 'script',
            type: 'POST',
            beforeSend: function (xhr) {
                el.trigger('ajax:loading', xhr); 
            },
            success: function (data, status, xhr) {
                el.trigger('ajax:success', [data, status, xhr]);
            },
            complete: function (xhr) {
                el.trigger('ajax:complete', xhr);
            },
            error: function (xhr, status, error) {
                el.trigger('ajax:failure', [xhr, status, error]);
            }
        });
    }
  });
});



