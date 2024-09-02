document.addEventListener('DOMContentLoaded', function () {
    const inputElement = document.getElementById('tenViTri1');

    inputElement.addEventListener('input', function () {
        let value = this.value;

        // Loại bỏ tất cả các ký tự không phải số và chữ
        value = value.replace(/[^a-zA-Z0-9]/g, '');

        // Chia giá trị thành các phần nhỏ và nối chúng lại với dấu chấm
        let formattedValue = value.split('').join('.');

        // Cập nhật giá trị của ô nhập liệu
        this.value = formattedValue;
    });
});
document.addEventListener('DOMContentLoaded', function () {
    const inputElement = document.getElementById('tenViTri');

    inputElement.addEventListener('input', function () {
        let value = this.value;

        // Loại bỏ tất cả các ký tự không phải số và chữ
        value = value.replace(/[^a-zA-Z0-9]/g, '');

        // Chia giá trị thành các phần nhỏ và nối chúng lại với dấu chấm
        let formattedValue = value.split('').join('.');

        // Cập nhật giá trị của ô nhập liệu
        this.value = formattedValue;
    });
});
document.addEventListener('DOMContentLoaded', function () {
    const giaTienInput = document.getElementById('giaTien');

    // Hàm định dạng số
    function formatNumber(value) {
        // Loại bỏ tất cả ký tự không phải số
        const cleanedValue = value.replace(/\D/g, '');

        // Thêm dấu phân cách cho số
        const groupedValue = cleanedValue.replace(/\B(?=(\d{3})+(?!\d))/g, '.');

        return groupedValue;
    }

    // Xử lý sự kiện khi người dùng nhập liệu
    giaTienInput.addEventListener('input', function () {
        // Định dạng giá tiền
        const formattedValue = formatNumber(giaTienInput.value);

        // Cập nhật giá trị ô nhập liệu
        giaTienInput.value = formattedValue;
    });
});
