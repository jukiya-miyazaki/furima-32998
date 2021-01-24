const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    // new FormData(フォームの要素);
    // フォームに入力された値を取得できるオブジェクト

    const card = {
      number: formData.get("home_object[number]"),
      cvc: formData.get("home_object[cvc]"),
      exp_month: formData.get("home_object[exp_month]"),
      exp_year: `20${formData.get("home_object[exp_year]")}`,
      // 生成したFormDataオブジェクトからクレジットカードに関する情報を取得
      // 変数cardに代入するオブジェクトとして定義
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
  
        // カード情報をPAY.JP側に送りトークン化する
        // アロー関数の引数 = status,response
        const renderDom = document.getElementById("charge-form");

        const tokenObj = `<input value=${token} name='token' type='hidden'> `;
        // トークンの値をブラウザ上で非表示にする

        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        // input要素を生成しフォームに加え、その値としてトークンをセット
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      // フォームに存在するクレジットカードの各情報を削除

      document.getElementById("charge-form").submit();
      // サーバーサイドに送信
    });
  });
};

window.addEventListener("load", pay);