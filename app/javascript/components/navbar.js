const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  if (navbar) {
    if (document.querySelector('.usp')) {
    navbar.classList.remove('navbar-lewagon-grey');
  }
    window.addEventListener('scroll', () => {
      if (window.scrollY >= (0.2*window.innerHeight)) {
        navbar.classList.add('navbar-lewagon-grey');
      } else {
        navbar.classList.remove('navbar-lewagon-grey');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
