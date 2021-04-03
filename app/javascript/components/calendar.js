const toggleCalendar = () => {
  const dailyView = document.getElementById('view-day')
  const monthlyView = document.getElementById('view-month')
  const dateToggle = document.getElementById('filter')
  const startDate = document.getElementById('start')
  const endDate = document.getElementById('end')

  dailyView.addEventListener("click", () => {
    window.location.href = `/bookings?view=list`
  });
  monthlyView.addEventListener("click", () => {
    window.location.href = `/bookings`
  });

  dateToggle.addEventListener("click", () => {
    window.location.href = `/bookings?view=list&start=${start.value}&end=${end.value}`
  });
}

const getUrlVars = () => {
    let vars = {};
    let parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
        vars[key] = value;
    });
    console.log(vars)
    if (vars.view == 'list') {
    document.getElementById('months-bookings').style.display = "none";
    document.getElementById('todays-bookings').style.display = "block";
    }
}

export { toggleCalendar };
export { getUrlVars };
