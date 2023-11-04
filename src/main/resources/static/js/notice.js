////////////////////////////
// 페이지네이션 //
///////////////////////////
//변수 및 상수 정의
const contents = document.querySelector(".contents_list"); //글목록 부모 요소 지정
const paging = document.querySelector(".paging");
const pageNums = document.querySelector(".paging"); //페이지 숫자 부모 요소 지정

let numOfContents = 230; // 전체 글 개수 - 추후 백에서 받아오는 걸로
const maxContent = 15; // 한 페이지당 글 최대 개수
const maxButton = 5; // 한 화면에 보여지는 페이지 버튼의 최대 개수
let maxPage = Math.ceil(numOfContents / maxContent); // 총 페이지 개수
let currentPage = 1; // 현재 페이지, 주소창 쿼리에서 받아오게 만들면.

//글목록 생성 함수
const makeContent = (id) => {
  const content = document.createElement("tr");
  content.innerHTML =
    '<td class="notice_type">컨텐츠 공지</td><td class="notice_title"><a href="viewNotice.html">여기에 제목이 표시됩니다.</a></td><td class="created_at">23.10.22.</td>';

  //데이터 연동 버전, 빈칸 채우기
  // content.innerHTML =
  // '<td class="notice_type"></td><td class="notice_title"></td class="created_at"><td>';
  return content;
};

//페이지 번호 생성 함수
const makeButton = (id) => {
  const button = document.createElement("a");
  button.classList.add("num");
  button.href = "#";
  button.dataset.num = id;
  button.innerText = id;
  button.addEventListener("click", (e) => {
    Array.prototype.forEach.call(pageNums.children, (a) => {
      if (a.dataset.num) {
        a.classList.remove("on");
      }
    });
    e.target.classList.add("on");
    renderContent(parseInt(e.target.dataset.num));
  });
  return button;
};

//글 목록 렌더링 : 현재 페이지를 기반으로 글 목록 생성
const renderContent = (currentPage) => {
  //목록 리스트 초기화
  while (contents.hasChildNodes()) {
    contents.removeChild(contents.lastChild);
  }

  //화면에 최대 10개의 글 생성
  for (
    let id = (currentPage - 1) * maxContent + 1;
    id <= currentPage * maxContent && id <= numOfContents;
    id++
  ) {
    contents.appendChild(makeContent(id));
  }
};

//버튼 번호 렌더링 : 현재 페이지를 기반으로 버튼 생성
const renderButton = (currentPage) => {
  //버튼 번호 초기화
  while (pageNums.hasChildNodes()) {
    pageNums.removeChild(pageNums.lastChild);
  }

  // 최대 5개의 페이지 버튼 생성
  for (
    let id = currentPage;
    id < currentPage + maxButton && id <= maxPage;
    id++
  ) {
    pageNums.appendChild(makeButton(id));
  }

  // 첫번째 버튼 활성화(class="on")
  pageNums.children[0].classList.add("on");

  // 페이지 이동 버튼 생성
  pageNums.prepend(prev);
  pageNums.prepend(first);
  pageNums.append(next);
  pageNums.append(last);

  // 페이지 이동 버튼 필요성 체크
  if (currentPage - maxButton < 1) {
    pageNums.removeChild(prev);
    pageNums.removeChild(first);
  }
  if (currentPage + maxButton > maxPage) {
    pageNums.removeChild(next);
    pageNums.removeChild(last);
  }
};

// 페이지 이동 함수
const goFirstPage = () => {
  currentPage = 1;
  render(currentPage);
};

const goPrevPage = () => {
  currentPage -= maxButton;
  render(currentPage);
};

const goNextPage = () => {
  currentPage += maxButton;
  render(currentPage);
};

const goLastPage = () => {
  currentPage = maxPage;
  renderButton(currentPage);
};

const first = document.createElement("a");
first.classList.add("first");
first.innerHTML = '<i class="fa-solid fa-angles-left"></i>';
first.addEventListener("click", goFirstPage);

const prev = document.createElement("a");
prev.classList.add("prev");
prev.innerHTML = '<i class="fa-solid fa-angle-left"></i>';
prev.addEventListener("click", goPrevPage);

const next = document.createElement("a");
next.classList.add("next");
next.innerHTML = '<i class="fa-solid fa-angle-right"></i>';
next.addEventListener("click", goNextPage);

const last = document.createElement("a");
last.classList.add("last");
last.innerHTML = '<i class="fa-solid fa-angles-right"></i>';
last.addEventListener("click", goLastPage);

const render = (currentPage) => {
  renderContent(currentPage);
  renderButton(currentPage);
};

//초기 페이지 렌더링
render(currentPage);

////////////////////////////
// 공지 쓰기 버튼 // 설정 필요 없으면 삭제하세요
///////////////////////////
let userId = admin;
if (userId !== "adimin") { //관리자 로그인이 아닌 경우, 공지 쓰기 버튼 삭제
  document.querySelector(".write").classList.remove("active");
}
