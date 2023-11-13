const toggleMenu = document.querySelector(".menu");
const toggleMenu2 = document.querySelector(".menu2");
const mediaMenu = document.querySelector(".media_menu");
function menuToggle() {
  //   const toggleMenu = document.querySelector(".menu");
  toggleMenu.classList.toggle("active");
}
function menu2Toggle() {
  //   const toggleMenu = document.querySelector(".menu2");
  toggleMenu2.classList.toggle("active");
}

function mediaToggle() {
  mediaMenu.classList.toggle("act");
}
function isClickToggle(event) {
  if (!toggleMenu.parentElement.contains(event.target)) {
    if (toggleMenu.classList.contains("active")) {
      toggleMenu.classList.toggle("active");
    }
  }
  if (!toggleMenu2.parentElement.contains(event.target)) {
    if (toggleMenu2.classList.contains("active")) {
      toggleMenu2.classList.toggle("active");
    }
  }
}
document.addEventListener("click", function (event) {
  isClickToggle(event);
});

// 로딩 화면
$(document).ready(function () {
  $(".loader").delay(900).fadeOut();
});
//로딩바
if(document.querySelector(".load_text")){
var text = document.querySelector(".load_text");
var percent = document.querySelector(".percent");
var progress = document.querySelector(".progress");
var count = 4;
var per = 16;
var loading = setInterval(animate, 7);

}
function animate() {
  if(count == 100 && per == 400){
  
    text.classList.add("add");
    clearInterval(loading);
  } else {
    per = per + 4;
    count = count + 1;
    progress.style.width = per + "px";
    percent.textContent = count + "%";
  }
}
