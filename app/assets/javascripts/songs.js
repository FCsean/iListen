var current = 0;

function clickSong(n){
  if($('#delete').prop('checked')){
    $.ajax({
      type:'POST',
      url:'/delete/song',
      data: { song_id : gon.songs[n].id
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
    changeSong(n);
  }
}

function changeSong(n){
  current = n;
  var player = document.getElementById("player");
  var playing = !player.paused;
  $("#player").attr("src", gon.songs[n].url);
  $("#currently").text(gon.songs[n].artist + " - " + gon.songs[n].title);
  if(playing)
    player.play();
};

function nextSong(){
  current++;
  current %= gon.songs.length;
  changeSong(current);
}

function prevSong(){
  current--;
  current = current < 0 ? current.length-1 : current;
  changeSong(current);
}

$(document).ready(function(){
  $("#delete").attr('checked', false);
  $("#player").on("ended", function(){nextSong(); document.getElementById("player").play();});
  $("#player").on("play", function(){document.getElementById("headphones").play()});
  $("#player").on("pause", function(){document.getElementById("headphones").pause()});
})