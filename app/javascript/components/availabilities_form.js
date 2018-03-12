const onAvailabilityClicked = (event) => {
  event.currentTarget.classList.toggle("availablity-active");
  const checkbox = event.currentTarget.querySelector("input");
  checkbox.checked = !checkbox.checked
}

const initializeAvailabilities = () => {
  document.querySelectorAll(".availability-choice").forEach((availability) => {
    availability.addEventListener("click", onAvailabilityClicked);
  });
}

export {initializeAvailabilities}
