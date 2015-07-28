$(document).ready(function() {
  bindEvents();
});


function bindEvents() {
  //show/hide edit event form******************
      $('#challenge_list').on('click', '.edit', function(){
        var id = $(this).parent().attr('id')
        $('#edit' + id).slideToggle();
  });

  //new activity ajax call********************
  $('#activity_form').on('submit', function(event){
    event.preventDefault();

    var path = $('#activity_form').attr('action');
    var form_data = $(this).serialize();
    var client_request = $.ajax({
      url: path,
      type: 'post',
      data: form_data
    });

    client_request.done(function(server_response) {
      console.log(server_response)
      //add new challenge
      $('#challenge_list').append(server_response);
      //FIX: setup toggle effect for edit button - right now you click on existing challenges and they hide and show really fast

      // this.find()

      $('#challenge_select').replaceWith

      //ADD: new challenge needs to show up in the form select
      // var title = $('#title' + id).text();
      // console.log(title)
      //add challenge to record points form select
      // $('#challenge_select').append("<option value='" + id + "'>" + title + "</option>");


    });

    client_request.fail(function(server_response) {
      console.log("fail");
      console.log(server_response);
      });
    });

    //delete activity ajax call*****************
  $('#challenge_list').on('click', '.delete', function(event) {
    event.preventDefault();

    var path = $(this).attr('href')

    var client_request = $.ajax({
      url: path,
      type: "delete",
    });

    client_request.done(function(server_response) {
      var activity_id = '#' + server_response.id;
      $(activity_id).remove();
    });

    client_request.fail(function(server_response) {
      console.log("fail");
    });
  });

  // edit activity form ajax call********************
  $('.update').parent().on('submit', function(event){
    event.preventDefault();
    console.log("default prevented")

    var path = $(this).attr('action');
    var form_data = $(this).serialize();

    console.log(form_data);

    var client_request = $.ajax({
      url: path,
      type: 'put',
      data: form_data
    });

    client_request.done(function(server_response) {
      console.log("success");
      $('#title' + server_response.id).text(server_response.title);
      $('#description' + server_response.id).text(server_response.description);
      $('#date' + server_response.id).text(server_response.date);
      $('#edit' + server_response.id).hide();

    });

    client_request.fail(function(server_response) {
      console.log("failure");
    });
  });

  //new score form*******************
  $('#new_score').on('submit', function(event){
    event.preventDefault();
    console.log("event prevented");

    var path = $(this).attr('action');
    // console.log(path);
    var form_data = $(this).serialize();
    // console.log(path + "|" + form_data);
    var client_request = $.ajax({
      url: path,
      type: 'post',
      data: form_data
    });

    client_request.done(function(server_response){
      console.log("success");
      $('#scoreboard-listing').replaceWith(server_response);
    });

    client_request.fail(function(server_response){
      console.log("failure");
      console.log(server_response.responseText);
    });
  });
}; //end bind events




