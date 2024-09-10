document.addEventListener('DOMContentLoaded', function () {
    // Lấy tất cả các nhóm sản phẩm
    var quantityContainers = document.querySelectorAll('.product-details');

    quantityContainers.forEach(function (container) {
        var quantityInput = container.querySelector('.quantity');
        var minValue = parseInt(quantityInput.min);
        var maxValue = parseInt(quantityInput.max);

        // Giảm số lượng
        container.querySelector('.quantity-left-minus').addEventListener('click', function () {
            var currentValue = Number(quantityInput.value);
            if (currentValue > minValue) {
                quantityInput.value = currentValue - 1;
            }
        });

        // Tăng số lượng
        container.querySelector('.quantity-right-plus').addEventListener('click', function () {
            var currentValue = Number(quantityInput.value);
            if (currentValue < maxValue) {
                quantityInput.value = currentValue + 1;
            }
        });

        // Kiểm tra giá trị nhập vào ô input
        quantityInput.addEventListener('input', function () {
            var currentValue = Number(quantityInput.value);

            // Nếu giá trị không phải là số hoặc lớn hơn max thì gán bằng max
            if (isNaN(currentValue) || currentValue > maxValue) {
                quantityInput.value = maxValue;
            }

            // Nếu giá trị nhỏ hơn min thì gán bằng min
            if (currentValue < minValue) {
                quantityInput.value = minValue;
            }
        });
    });
});

