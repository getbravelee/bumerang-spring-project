/************/
/* 에디터 삽입 */
/************/

var quill = new Quill('#editor-container', {
    modules: {
      toolbar: [
        [{ header: [1, 2, 3, 4, 5, false] }],
        ['bold', 'italic', 'underline'],
        ['image', 'code-block']
      ]
    },
    placeholder: '내용을 입력하세요',
    theme: 'snow'  // or 'bubble'
  });
  
  