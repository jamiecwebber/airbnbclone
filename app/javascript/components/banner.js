import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Fascinating experiences... ^500 with fascinating people!"],
    typeSpeed: 35,
    showCursor: false,
    loop: false
  });
};

export { loadDynamicBannerText };
