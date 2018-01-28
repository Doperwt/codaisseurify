function submitNewSong(event){
  event.preventDefault();
  createSong($("#song_name").val(),$("#song_duration").val());
  $("#song_name").val(null);
};
function createSong(songTitle,duration){
  let artist = $("h2").id
  $.ajax({
      type: "POST",
      url: "/api/artists/${artist}/songs.json",
      data: JSON.stringify({
        name: songTitle,
        duration: duration
      }),
      contentType: "application/json",
      dataType: "json"
    })
};

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
  $("#deletesong").bind('click', deleteSong);
  $("#delete-all-songs").bind('click', deleteAllSongs);
  $("#delete_artist").bind('click', deleteArtist);

});
