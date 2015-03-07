var current = 0;

function clickSongInPlaylist(n){
  if($('#delete').prop('checked')){console.log("Delete");
    $.ajax({
      type:'POST',
      url:'/delete/songinplaylist',
      data: { song_id : gon.songs[n].id,
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
  }else{
    var array = gon.playlist_songs;
    current = song_list.indexOf(gon.playlist_songs[n]);
    var player = document.getElementById("player");
    var playing = !player.paused;
    $("#player").attr("src", array[n].url);
    $("#currently").text(array[n].artist + " - " + array[n].title)
    if(playing)
      player.play();
  }
}

function changeSongInPlaylist(n, array){
  current = n;
  var player = document.getElementById("player");
  var playing = !player.paused;
  $("#player").attr("src", array[n].url);
  $("#currently").text(array[n].artist + " - " + array[n].title)
  if(playing)
    player.play();
};

function nextSongInPlaylist(){
  current++;
  current %= gon.playlist_songs.length;
  changeSongInPlaylist(current, song_list);
}

function prevSongInPlaylist(){console.log("n");
  current--;
  current = current < 0 ? current.length-1 : current;
  changeSongInPlaylist(current, song_list);
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

function clickPlaylist(n){
  if($('#delete').prop('checked')){
    $.ajax({
      type:'POST',
      url:'/delete/playlist',
      data: { playlist_id : gon.playlists[n].id
            },
      success:function(){
        //I assume you want to do something on controller action execution success?
        location.reload();
      },
      error:function(){
        location.reload();
      }
    });

  }else{
    redirect("playlist/"+gon.playlists[n].name)
  }
}

function redirect(n){
  location.assign(n);
}

$("document").ready(function (){
  $("#search").keyup(function() {
    var q = $("#search").val().toUpperCase();
    if(q.length < 0) return;
    q = q.split(/\s+/);
    var f = gon.songs.filter(function(s){ return q.every(function (r){ return s.title.toUpperCase().contains(r) || s.artist.toUpperCase().contains(r);});});
    var m = f.map(function(s){ return s.artist + " - " + s.title;});
    id = f.length > 0 ? f[0].id : -1;
    $("#search_results").html(m.length == 0 ? "" : m.join("<br>"));
  });
  var f = gon.songs;
  var m = f.map(function (s) {return s.artist + " - " + s.title;});
  id = f.length > 0 ? f[0].id : -1;
  $("#search_results").html(m.join("<br>"));
  $("#delete").attr('checked', false); 
  $("#player").on("ended", function(){nextSongInPlaylist(); document.getElementById("player").play();});
  $(function() {
    $("#songList").sortable();
    $("ol, li").disableSelection();
  });
  $("#songList").on("sortupdate", function(event, ui){
    var sorted = $("#songList").sortable("toArray");
    for(var i = 0; i < gon.playlist_songs.length; i++){
      song_list[i] = gon.playlist_songs[sorted[i]];
    }
  });
  song_list = [];
  for(var i = 0; i < gon.playlist_songs.length; i++){
    song_list.push(gon.playlist_songs[i]);
  }
});