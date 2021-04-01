const toggleModal = () => {
const modalButton = document.getElementById('new-customer-modal-submit')
const customerSelect = document.getElementById('booking_customer')
modalButton.addEventListener("click", () => {

  const name = document.getElementById('customer_name').value
  let option = document.createElement("option");
  document.querySelector('.modal').style.display = 'none';
  document.querySelector('.modal-backdrop').style.display= 'none';
  option.text = name;
  customerSelect.add(option, customerSelect[0]);
  customerSelect.options[0].selected = true;

  });
}

export { toggleModal };
