// Return a helper with preserved width of cells
var fixHelper = function(e, ui) {
	ui.children().each(function() {
		$(this).width($(this).width());
	});
	return ui;
};

$(function(){
  $("#sortable_issues").sortable({
    helper: fixHelper,
    items:'.issues', 
    containment:'parent', 
    axis:'y', 
    update: function() {
      var el    = $(this);
      var issue_id = [];
      
      $("#sortable_issues").children().each(function(index) {
        // console.log($(this).children(".issue_id").children("span").attr("data-issue_id"))
        issue_id.push($(this).children(".issue_id").children("span").attr("data-issue_id"))
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

  
  $('#issue_user').live('change', function() {
      
    var el    = $(this);
    var issue_id = $(this).parents(".issues").children(".issue_id").children("span").attr("data-issue_id");
    var assigned_user = $("#issue_user option:selected").val();
      
    var data = {issue_id : issue_id, assigned_user : assigned_user}

      $.ajax({
            url:  "/issues/assignment",
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
  });


});



