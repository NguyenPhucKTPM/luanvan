function startCountdown(display) {
    // Lấy thời gian kết thúc từ localStorage hoặc đặt thời gian mặc định 10 phút
    const endTime = localStorage.getItem('endTime');
    const currentTime = Date.now();
    
    let timer;
    if (endTime && currentTime < endTime) {
        timer = endTime - currentTime;
    } else {
        const tenMinutes = 60 * 10 * 1000; // 10 minutes in milliseconds
        timer = tenMinutes;
        localStorage.setItem('endTime', currentTime + timer);
    }

    function updateDisplay() {
        let minutes = Math.floor(timer / 60000);
        let seconds = Math.floor((timer % 60000) / 1000);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.textContent = minutes + ":" + seconds;

        if (timer <= 0) {
            clearInterval(interval);
            display.textContent = "00:00";
            localStorage.removeItem('endTime');
        } else {
            timer -= 1000; // Giảm 1 giây
        }
    }

    updateDisplay();
    const interval = setInterval(updateDisplay, 1000);
}

window.onload = function () {
    const display = document.querySelector('#countdown');
    startCountdown(display);
};