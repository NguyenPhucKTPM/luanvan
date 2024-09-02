document.addEventListener('DOMContentLoaded', function () {
    // Hiển thị hoặc ẩn trường khi nút được nhấn
    document.querySelectorAll('[data-toggle="field"]').forEach(button => {
        button.addEventListener('click', function () {
            const targetSelector = this.getAttribute('data-target');
            const targetElement = document.querySelector(targetSelector);
            
            if (targetElement) {
                // Chuyển đổi giữa hiển thị và ẩn
                if (targetElement.style.display === 'none' || targetElement.style.display === '') {
                    targetElement.style.display = 'block'; // Hiển thị phần tử
                } else {
                    targetElement.style.display = 'none'; // Ẩn phần tử
                }
            }
        });
    });

    // Định dạng giá tiền
    const giaTienInput = document.getElementById('giaTien');

    if (giaTienInput) {
        function formatNumber(value) {
            const cleanedValue = value.replace(/\D/g, ''); // Loại bỏ tất cả ký tự không phải số
            const groupedValue = cleanedValue.replace(/\B(?=(\d{3})+(?!\d))/g, '.'); // Thêm dấu phân cách cho số
            return groupedValue;
        }

        giaTienInput.addEventListener('input', function () {
            const formattedValue = formatNumber(giaTienInput.value);
            giaTienInput.value = formattedValue;
        });
    }
});
