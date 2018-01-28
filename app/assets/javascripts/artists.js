function submitNewSong(event){
  event.preventDefault();
  let artist = $("#song_name").parent()
  let artistId = artist_id.value
  createSong($("#song_name").val(), $("#song_duration").val() ,artistId);
  $("#song_name").val(null);
  $("#song_duration").val(null);
  $("#submit_song").prop('disabled', false);
  submit = $("#submit_song")[0]
  console.log(submit);
};
function createSong(songTitle,duration,artistId){
  $.ajax({
      type: "POST",
      url: "/api/artists/"+artist_id.value+"/songs.json",
      data: JSON.stringify({
        name: songTitle,
        duration: duration,
        artist: artistId
      }),
      contentType: "application/json",
      dataType: "json"
    })
    .done(function(data){
      console.log(data);
      let list = $("#song_list");
      let durationInMinutes = `${(data.duration-(data.duration%60))/60} minutes and ${data.duration%60} seconds`
      let div = $(`<div id="song-${data.id}"></div>`);
      let listItem = $(`<li class="song">${data.name} duration: ${durationInMinutes}</li>`);
      let destroyButton = $(`<a href= "/artists/${data.artist_id}" class= "button delete_song" id="${data.id}"  >Delete song</a>`);
      destroyButton.bind('click',deleteSong);
      listItem.append(destroyButton);
      div.append(listItem);
      list.append(div);
    })
    .fail(function(error) {
    console.log(error);
    error_message = error.responseJSON.title[0];
    showError(error_message);
  });


}
function showError(message) {
 let errorHelpBlock = $('<span class="help-block"></span>')
   .attr('id', 'error_message')
   .text(message);

 $("#formgroup-title")
   .addClass("has-error")
   .append(errorHelpBlock);
}
function deleteAllSongs(event){
  event.preventDefault();
  console.log(this);

};

function deleteSong(event){
  event.preventDefault();
  console.log(this);
  let anchor = this;
  let song_id = anchor.id;
  console.log(song_id);
  removeSong(song_id);
};

function removeSong(song){
  artist = $("#song_name").parent()
  artistId = artist_id.value
  $.ajax({
      type: "DELETE",
      url: "/api/artists/"+artist_id.value+"/songs/"+song+".json",
      contentType: "application/json",
      dataType: "json"
    })
    .done( function(data) {
      song_id =data.id;
      console.log(song_id);

      $(`#song-${song_id}`).remove();
    })
    .fail(function(error) {
    console.log(error);
    error_message = error.responseJSON.title[0];
    showError(error_message);
  });
};
function deleteArtist(event){
  event.preventDefault();
  console.log(this);

};


$(document).ready(function() {
  $("form").bind('submit', submitNewSong);
  $(".delete_song").bind('click', deleteSong);
  $("#delete_all_songs").bind('click', deleteAllSongs);
  $("#delete_artist").bind('click', deleteArtist);

});
