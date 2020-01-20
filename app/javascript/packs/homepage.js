const downArrow = document.querySelector('.fa-angle-double-down')
if (downArrow != null) {
  downArrow.addEventListener('click', (event) => {
    window.scrollBy(0, window.innerHeight );
  })
}
