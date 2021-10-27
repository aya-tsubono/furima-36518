window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const Tax = 0.1
    const price = inputValue * Tax
    addTaxDom.innerHTML = Math.floor(price)
    const gain = inputValue - price
    profit.innerHTML = Math.floor(gain)
  })
});