var scrollDirection = 1, pageScroll;
  pageScroll = function() {
    window.scrollBy(0,scrollDirection);
    scrolldelay = setTimeout(pageScroll,1);
    if ( (window.scrollY === 0) || (window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
        scrollDirection = -1*scrollDirection;
    }
  }
  pageScroll();
