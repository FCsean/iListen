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

function prevSong(){
  current--;
  current = current < 0 ? current.length-1 : current;
  changeSong(current);
}

