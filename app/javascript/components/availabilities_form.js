const onAvailabilityClicked = (event) => {
  event.currentTarget.classList.toggle("availablity-active");
  const checkbox = event.currentTarget.querySelector("input");
  checkbox.checked = !checkbox.checked

  if (checkbox.parentElement.classList.contains("availablity-active")) {
    checkbox.parentElement.querySelector(".fa-times").style.display="none";
    checkbox.parentElement.querySelector(".fa-check").style.display="initial";
  }
  else{
    checkbox.parentElement.querySelector(".fa-times").style.display="initial";
    checkbox.parentElement.querySelector(".fa-check").style.display="none";

  }
}

const initializeAvailabilities = () => {
  document.querySelectorAll(".availability-choice").forEach((availability) => {
    availability.addEventListener("click", onAvailabilityClicked);
  });
}

export {initializeAvailabilities}
