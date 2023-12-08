
const customSelects = document.querySelectorAll(".color-input");
const selectButtons = document.querySelectorAll("option");

customSelects.forEach((customSelect) => {
  const selectBtn = customSelect.nextElementSibling;
  const selectedValue = selectBtn.querySelector(".selected-value");
  const optionsList = customSelect.querySelectorAll("option");
  console.log(selectedValue);
  selectBtn.addEventListener("click", () => {
    customSelect.classList.toggle("active");
    selectBtn.setAttribute(
      "aria-expanded",
      selectBtn.getAttribute("aria-expanded") === "true" ? "false" : "true"
    );
  });

  optionsList.forEach((option) => {
    function handler(e) {
      if (e.type === "click" && e.clientX !== 0 && e.clientY !== 0) {
        selectedValue.textContent = this.textContent;
        customSelect.classList.remove("active");
      }
      if (e.key === "Enter") {
        selectedValue.textContent = this.textContent;
        customSelect.classList.remove("active");
      }
    }

    option.addEventListener("keyup", handler);
    option.addEventListener("click", handler);
  });
});
