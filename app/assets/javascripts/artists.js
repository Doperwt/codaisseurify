function submitNewSong(event){
  event.preventDefault();
  artist = $("#song_name").parent()
  artistId = artist_id.value
  createSong($("#song_name").val(), $("#song_duration").val() ,artistId);
  $("#song_name").val(null);
  $("#song_duration").val(null);
  $("#new_song").val(null);
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
      let destroyButton = $(`<a href= "/artists/${data.artist_id}/songs/${data.id}" class= "button" id="delete_song" data-method= "delete" data-confirm="Are you sure?" >Delete song</a>`);
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

  function showError(message) {
   let errorHelpBlock = $('<span class="help-block"></span>')
     .attr('id', 'error_message')
     .text(message);

   $("#formgroup-title")
     .addClass("has-error")
     .append(errorHelpBlock);
  }
}

function deleteAllSongs(event){
  event.preventDefault();

};

function deleteSong(event){
  event.preventDefault();

};
function deleteArtist(event){
  event.preventDefault();

};

$(document).ready(function() {
  $("form").bind('submit', submitNewSong);
  $("#delete_song").on('click', deleteSong);
  $("#delete_all_songs").bind('click', deleteAllSongs);
  $("#delete_artist").bind('click', deleteArtist);

});
