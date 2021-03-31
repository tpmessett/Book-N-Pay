const toggleCalendar = () => {
  const dailyCalendar = document.getElementById('todays-bookings')
  const monthlyCalendar = document.getElementById('months-bookings')
  const dailyView = document.getElementById('view-day')
  const monthlyView = document.getElementById('view-month')
  dailyView.addEventListener("click", () => {
    monthlyCalendar.style.display = "none";
    dailyCalendar.style.display = "block";
  });
  monthlyView.addEventListener("click", () => {
    dailyCalendar.style.display = "none";
    monthlyCalendar.style.display = "block";
  });
}

export { toggleCalendar };
