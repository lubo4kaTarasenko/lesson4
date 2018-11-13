$(document).ready(function(){
  $("#search_btn").click(function(){
    $tasksArr = $(".all_tasks")    
    searchVal = $("#search_field").val().trim()
    for(var i = 0; i < $tasksArr.length; i++){
      var elem = $tasksArr[i]
      $elemInput = $(elem).find(".task_text")
      val = $($elemInput).val()
      if (val.indexOf(searchVal) != -1){
        $($tasksArr[i]).show()
      }
      else{
        $($tasksArr[i]).hide()
      }
    }
  })

  $(".task_text").click(function(){
    t = $(this)
    $textArea = t.parents("form").find(".h0")
    $textArea.toggleClass("h150")
  })


  $(".task_checkbox").click(function(){
    checkbox = $(this)
    $textField = checkbox.parents("form").find(".new_task")
    $textField.toggleClass("done_task")

  })

  $(":checkbox:checked").each(function(){
    checkbox = $(this)
    $textField = checkbox.parents("form").find(".new_task")
    $textField.toggleClass("done_task") 
  })
});