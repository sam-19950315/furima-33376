// window.addEventListener("load", () => {
//   const priceInput = document.getElementById("item-price");
//   console.log(priceInput);
// });

window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue / 10);
    const addTaxDomValue = Math.floor(inputValue / 10);
    const profitDom = document.getElementById("profit");
    profitDom.innerHTML = (inputValue - addTaxDomValue);
  });
});