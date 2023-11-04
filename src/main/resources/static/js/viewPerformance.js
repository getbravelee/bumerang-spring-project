/*******/
/* 댓글 */
/*******/
const submitBtn = document.querySelector(".submit_btn");
const userName = document.querySelector("#user");
const comment = document.querySelector("#comment");
const commentsCont = document.querySelector(".comments_container");

submitBtn.addEventListener("click", submitFeedback);
submitBtn.addEventListener("click", resizeTextarea);

// 댓글 저장을 위한 배열
feedbackArr = [];

//댓글을 배열에 저장하는 함수
function submitFeedback(e) {
  // get user name
  const userForm = userName.value;
  // get feedback
  const commentForm = comment.value;
  const currentTime = new Date();
  // if inputs are not empty
  if (userForm && commentForm !== "") {
    // create new feedback
    newFeedback = {
      id: 1,
      userName: userForm,
      userComment: commentForm,
      createdDate: currentTime.toString(),
    };
    // add new feedback to array
    feedbackArr.push(newFeedback);
    resetForm();
    // add feedback to list
    addFeedback(newFeedback);
  }

  e.preventDefault();
}

// 댓글 창을 초기화 함수
function resetForm() {
  comment.value = "";
}

// 저장된 배열에서 댓글 정보를 불러와 html에 붙여넣는 함수
function addFeedback(item) {
  const letter = "";
  // create new div
  const div = document.createElement("div");
  // add class
  div.classList = "comment_card";
  // add id
  div.id = item.id;
  // add html
  div.innerHTML = `
        <div class="comment_top">
            <div class="comment_info">
                <div class="pic center_display">
                    <img src="${letter}" alt="image"/>
                </div>
                <div class="comment_info_txt">
                    <p class="nickname">
                        ${item.userName}
                    </p>
                    <p class="created_date">${item.createdDate}</p>
                </div>
            </div>
            <div class="comment_btns">
                <button class='editBtn'>수정</button>
                <button class='removeBtn'>삭제</button>
                <button class='reportBtn'>신고하기</button>
            </div>
        </div>
        <textarea class="comment textarea" readonly>${item.userComment}</textarea>
        
    `;
  // insert feedback into the list
  commentsCont.insertAdjacentElement("beforeend", div);
  activeCommentBtn();
}

// 댓글 버튼 활성화
function activeCommentBtn() {
  // 각 버튼 요소 선택
  const editButtons = document.querySelectorAll(".editBtn");
  const removeButtons = document.querySelectorAll(".removeBtn");
  const reportButtons = document.querySelectorAll(".reportBtn");

  // 각 버튼과 함수 연결
  editButtons.forEach((editButton) => {
    editButton.addEventListener("click", editCommentBtn);
  });
  removeButtons.forEach((removeButton) => {
    removeButton.addEventListener("click", removeComment);
  });
  reportButtons.forEach((reportButton) => {
    reportButton.addEventListener("click", reportComment);
  });
}

// 댓글 수정
function editCommentBtn() {
  const commentCard = this.closest(".comment_card"); // 수정 버튼의 부모 comment_card 요소 찾기
  const textarea = commentCard.querySelector(".comment.textarea"); // 해당 comment_card 내의 textarea 요소 찾기
  textarea.readOnly = false;
  textarea.style.border = "1px solid #4b91f7";
  textarea.focus();

  const editBtn = commentCard.querySelector(".editBtn");
  editBtn.innerText = "저장";
  editBtn.removeEventListener("click", editCommentBtn);
  editBtn.addEventListener("click", saveComment);
}

// 수정 댓글 저장
function saveComment() {
  const commentCard = this.closest(".comment_card"); // 저장 버튼의 부모 comment_card 요소 찾기
  const textarea = commentCard.querySelector(".comment.textarea"); // 해당 comment_card 내의 textarea 요소 찾기
  textarea.readOnly = true;
  textarea.style.border = "none";

  const editBtn = commentCard.querySelector(".editBtn");
  editBtn.innerText = "수정";
  editBtn.removeEventListener("click", saveComment);
  editBtn.addEventListener("click", editCommentBtn);
}

// 댓글 삭제
function removeComment() {
  const commentCard = this.closest(".comment_card"); // 삭제 버튼의 부모 comment_card 요소 찾기
  commentsCont.removeChild(commentCard);
}

//  댓글 신고하기
function reportComment() {
  var nWidth = "500";
  var nHeight = "600";
  var xPos = document.body.clientWidth / 2 - nWidth / 2;
  xPos += window.screenLeft; //듀얼 모니터
  var yPos = screen.availHeight / 2 - nHeight / 2;

  window.open(
    "./report.html",
    "신고하기",
    "width=" +
      nWidth +
      ",height=" +
      nHeight +
      ",left=" +
      xPos +
      ", top=" +
      yPos +
      ",toolbar=no"
  );
}

// textarea 높이 조절 함수
// 새로운 댓글이 추가됐을 때 댓글창 height값을 지정해주기 위해 필요
function resizeTextarea() {
  const textareas = document.querySelectorAll(".textarea");

  for (let i = 0; i < textareas.length; i++) {
    textareas[i].style.height = "auto";
    textareas[i].style.height = textareas[i].scrollHeight + "px";
  }
}

// 페이지가 처음 로드될 때 기존 댓글들의 height값을 지정
window.addEventListener("load", resizeTextarea);
activeCommentBtn();
