const pay = () => {
  Payjp.setPublicKey("pk_test_76355348a33d4cfa984b9fa8");
  let btn = document.getElementById("charge-form");
  btn.addEventListener('click', (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("user_donation[number]"),
      exp_month: formData.get("user_donation[exp_month]"),
      exp_year: `20${formData.get("user_donation[exp_year]")}`,
      cvc: formData.get("user_donation[cvc]"),
    };
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window,addEventListener("load", pay);