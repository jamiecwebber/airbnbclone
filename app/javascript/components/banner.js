import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Your Next Great Experience Is Just a Click Away..."],
    typeSpeed: 35,
    showCursor: false,
    loop: false
  });
};

export { loadDynamicBannerText };
