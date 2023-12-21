
function oninputPhone(target) {
    target.value = target.value
    .replace(/[^0-9]/g, '')
    .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
}

function oninputDate(target) {
    target.value = target.value
        .replace(/[^0-9]/g, '') // 숫자 이외의 문자 제거
        .replace(/(\d{4})(\d{2})(\d{2})/, "$1-$2-$3"); // YYYYMMDD를 YYYY-MM-DD 형식으로 변환
}


