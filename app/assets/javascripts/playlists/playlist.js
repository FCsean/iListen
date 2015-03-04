var current = 0;

function changeSong(n){
  current = n;
  var player = document.getElementById("player");
  var playing = !player.paused;
  $("#player").attr("src", gon.songs[n].url);
  if(playing)
    player.play();
};

function nextSong(){
  current++;
  current %= gon.songs.length;
  changeSong(current);
}

function prevSong(){console.log("n");
  current--;
  current = current < 0 ? current.length-1 : current;
  changeSong(current);
}

function addToPlaylist(){
  if(id == -1)
    return;
  $.ajax({
    type:'POST',
    url:'/playlists/add',
    data: { song_id : id,
            playlist_name : $("#playlist_name").text()
          },
    success:function(){
      //I assume you want to do something on controller action execution success?
      location.reload();
    },
    error:function(){
      location.reload();
    }
  });
}

function redirect(n){
  location.replace("/playlist/"+n);
}
$("document").ready(function (){
  $("#search").keyup(function() {
    var q = $("#search").val().toUpperCase();
    if(q.length < 0) return;
    q = q.split(/\s+/);
    var f = gon.songs.filter(s => q.every(r => s.title.toUpperCase().contains(r) || s.artist.toUpperCase().contains(r)));
    var m = f.map(s => s.artist + " - " + s.title);
    id = f.length > 0 ? f[0].id : -1;
    $("#search_results").html(m.length == 0 ? "" : m.join("<br>"));
  });
  var f = gon.songs;
  var m = f.map(s => s.artist + " - " + s.title);
  id = f.length > 0 ? f[0].id : -1;
  $("#search_results").html(m.join("<br>"));
  $("#prev").click(prevSong);
  $("#next").click(nextSong);
  
})