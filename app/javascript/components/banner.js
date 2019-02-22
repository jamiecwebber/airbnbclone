import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Your Next Trippy Experience Is Just a Search Away..."],
    typeSpeed: 35,
    showCursor: false,
    loop: false
  });
};

export { loadDynamicBannerText };
