
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// External imports
import "bootstrap";

// Internal imports
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { toggleCalendar } from '../components/calendar';
import { getUrlVars } from '../components/calendar';
import { toggleModal } from '../components/modal';
import { toggleBookingType } from '../components/bookingcreation';

document.addEventListener('turbolinks:load', () => {
  if (document.querySelector('.usp')) {
    initUpdateNavbarOnScroll();
  }
  if (document.getElementById('todays-bookings')) {
    toggleCalendar();
    getUrlVars();
  }
  if (document.getElementById('new-customer-modal-submit')) {
    toggleModal();
    toggleBookingType();
  }
});
