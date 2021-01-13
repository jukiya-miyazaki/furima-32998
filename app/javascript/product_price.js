window.addEventListener('load', function() {
// load全て読み込まれた後に発火
  const priceInput = document.getElementById("item-price");
  // 金額を入力したときに画面上に動きがあった要素を示すidセレクタ
  priceInput.addEventListener("input", () => {
  // 金額をinputするたびに、イベント発火する
    const inputValue = priceInput.value;
    // value属性を指定し、inputした金額の値を取得
    const addTaxDom = document.getElementById("add-tax-price");
    const value_result = inputValue * 0.1
    addTaxDom.innerHTML = Math.floor(value_result);
    // 販売手数料の算出 小数点切り捨て
    const profitNumber = document.getElementById("profit")
    profitNumber.innerHTML = Math.ceil(inputValue - value_result);
    // 販売利益の算出 小数点切り上げ
  })
});

