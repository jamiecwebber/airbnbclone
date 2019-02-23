import Typed from 'typed.js';

const metaCheck = document.querySelector('#controller-action')
const check = (metaCheck.dataset.controller === "apartments" && metaCheck.dataset.method === "index")

const loadDynamicBannerText = () => {
  if (check) {
    new Typed('#banner-typed-text', {
      strings: ["Your Next Trippy Experience Is Just a Search Away..."],
      typeSpeed: 35,
      showCursor: false,
      loop: false
    });
  }
};

export { loadDynamicBannerText };
