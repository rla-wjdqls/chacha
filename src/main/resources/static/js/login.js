const signup = document.getElementById("sign-up");
signin = document.getElementById("sign-in");
loginin = document.getElementById("login-in");
loginup = document.getElementById("login-up");

signup.addEventListener("click", () => {
    loginin.classList.remove("block");
    loginup.classList.remove("none");

    loginin.classList.add("none");
    loginup.classList.add("block");
})

signin.addEventListener("click", () => {
    loginin.classList.remove("none");
    loginup.classList.remove("block");

    loginin.classList.add("block");
    loginup.classList.add("none");
})

// 예시 입력값
let tel = document.getelemgetElementById("tel");
let birth = document.getelemgetElementById("birth");

// 정규표현식을 사용하여 변환
let formattel = inputValue.replace(/(\d{3})(\d{3})(\d{2})/, "$1-$2-$3");

// 화면에 표시
console.log(formattedValue); // 브라우저 콘솔에 출력
document.body.innerHTML = `<p>${formattedValue}</p>`; // HTML body에 표시


function oninputPhone(target) {
    target.value = target.value
        .replace(/[^0-9]/g, '')
        .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
}
















