$(document).ready(function() {
  console.log('test');
  // getTasks();

  // add a task
  $('#task-submit').on('click', postTask);



});

//Functions
function getTasks() {
  $.ajax({
    type: 'GET',
    url: '/tasks',
    success: function(tasks) {
      appendTasks(tasks);
    },
    error: function() {
      console.log('Database error');
    }
  })
}

function appendTasks() {
  $("#container").empty();
  for (var i = 0; i < tasks.length; i++) {
    // $("#container").append('<div class="row book"></div>');
    $el = $('#container').children().last();
    var task = tasks[i];
    $el.data('id', task.id);
    $el.append(task);
  }
}

function postTask() {
  console.log("postTask test");
}
