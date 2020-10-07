const pay = () => {
  Payjp.setPublicKey("pk_test_76355348a33d4cfa984b9fa8");
  const form = document.getElementById("credit-card-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("credit-card-form");
    const formData = new FormData(formResult);

    const card = {
      number: formDat.get("card[number]"),
      exp_month: formData.get("card[exp_month]"),
      exp_year: formData.get("card[exp_year]"),
      cvc: formData.get("card[cvc]"),
    };
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("credit-card-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("card_number").removeAttribute("name");
      document.getElementById("card_cvc").removeAttribute("name");
      document.getElementById("card_exp_month").removeAttribute("name");
      document.getElementById("card_exp_year").removeAttribute("name");

      document.getElementById("credit-card-form").submit();
    });
  });
};

window,addEventListener("load", pay);