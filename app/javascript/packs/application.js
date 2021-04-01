
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// External imports
import "bootstrap";

// Internal imports
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { toggleCalendar } from '../components/calendar';
import { toggleModal } from '../components/modal';

document.addEventListener('turbolinks:load', () => {
  if (document.querySelector('.usp')) {
    initUpdateNavbarOnScroll();
  }
  if (document.getElementById('todays-bookings')) {
    toggleCalendar();
  }
  if (document.getElementById('new-customer-modal-submit')) {
    toggleModal();
    console.log("init")
  }
});
