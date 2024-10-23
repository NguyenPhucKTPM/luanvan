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

        quantityInput.addEventListener('input', function () {
            var currentValue = Number(quantityInput.value);

            if (isNaN(currentValue) || currentValue > maxValue) {
                quantityInput.value = maxValue;
            }

            if (currentValue < minValue) {
                quantityInput.value = minValue;
            }
        });
    });
});

