import "bootstrap";
import { loadDynamicBannerText } from '../components/banner';
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { slideShow } from '../components/gallery'

initUpdateNavbarOnScroll();
loadDynamicBannerText();
slideShow();
