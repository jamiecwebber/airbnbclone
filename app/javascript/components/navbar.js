const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-wagon');
  const logo = document.querySelector('.logo')
  const metaCheck = document.querySelector('#controller-action')
  const check = (metaCheck.dataset.controller === "apartments" && metaCheck.dataset.method === "index")

  if (navbar && check) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-wagon-white');
        // logo.insertAdjacentHTML('afterbegin', '<a href="/"><%= image_tag "logo-navbar-white", height: 50 %></a')
      } else {
        navbar.classList.remove('navbar-wagon-white');
        logo.classList.remove('navbar-wagon-white-logo')
      }
    });
  } else {
    navbar.classList.add('navbar-wagon-white');
    logo.classList.remove('navbar-wagon-white-logo')
  }
};

export { initUpdateNavbarOnScroll };
