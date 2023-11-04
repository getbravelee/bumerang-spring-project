document.addEventListener("DOMContentLoaded", function () {
  const submitButton = document.querySelector(".btn_wrap button");

  submitButton.addEventListener("click", function (event) {
    event.preventDefault();
    const selectedReason = document.querySelector('input[name="reason"]:checked').value;
    if (selectedReason === "기타") {
      const otherReason = document.querySelector(".guitar");
      if (otherReason) {
        const otherReasonValue = otherReason.value;
        console.log("기타 Reason:", otherReasonValue);
      }
    } else {
      console.log("Selected Reason:", selectedReason);
    }
    alert('제출 되었습니다.');
  });
});