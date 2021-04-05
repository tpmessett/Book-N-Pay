const toggleBookingType = () => {
  const addProducts = document.getElementById('itemised-button')
  const simpleButton = document.getElementById('simple-button')
  const itemised = document.getElementById('itemised')
  const simple = document.getElementById('simple-invoice')

  addProducts.addEventListener("click", () => {
    simple.style.display = 'none'
    itemised.style.display = 'block'
  })

  simpleButton.addEventListener("click", () => {
    itemised.style.display = 'none'
    simple.style.display = 'block'
  })
}

export { toggleBookingType };
