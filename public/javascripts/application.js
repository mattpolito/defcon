$(function(){
  $("#sortable_issues").sortable({
    items:'.issues', 
    containment:'parent', 
    axis:'y', 
    update: function() {
      var el    = $(this);
      var issue_id = [];
      var issues = $(this).parents("#sortable_issues");
    
      $.each(issues.children(), function(index, value){
        console.log($(value).find(".issues_id").children("span").attr("class"));
        issue_id.push($(value).find(".issues_id").children("span").attr("class").split("-")[1])
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



