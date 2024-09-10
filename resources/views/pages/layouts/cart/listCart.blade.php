@extends('pages.main')
@section('layouts')
<section class="ftco-section ftco-cart">
    <div class="container">
        <div class="row">
            <div class="col-md-12 ftco-animate">
                <div class="cart-list">
                    <table class="table">
                        <thead class="thead-primary">
                            <tr class="text-center">
                                <th>&nbsp;</th>
                                <th>&nbsp;</th>
                                <th>Tên sách</th>
                                <th>Giá nhập</th>
                                <th>Số lượng</th>
                                <th>Tổng cộng</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($carts as $data)
                            <tr class="text-center" data-id="{{ $data->id_ChiTietGioSach }}">
                                <td class="product-remove">
                                    <a href="#" data-id="{{ $data->id_ChiTietGioSach }}">
                                        <span class="ion-ios-close"></span>
                                    </a>
                                </td>
                                <td class="image-prod">
                                    <a href="{{ route('pageDetailBook', $data->id_Sach) }}">
                                        <div class="img" style="background-image:url({{ $data->duongDan }});"></div>
                                    </a>
                                </td>
                                <td class="product-name">
                                    <h3><a href="{{ route('pageDetailBook', $data->id_Sach) }}">{{ $data->tenSach }}</a></h3>
                                </td>
                                <td class="price">{{ number_format($data->giaTien, 0, ',', '.') }}₫</td>
                                <td class="quantity">
                                    <div class="input-group mb-3 product-details">
                                        <span class="input-group-btn mr-2">
                                            <button type="button" class="quantity-left-minus btn" data-type="minus" data-id="{{ $data->id_ChiTietGioSach }}">
                                                <i class="ion-ios-remove"></i>
                                            </button>
                                        </span>
                                        <input type="text" name="soLuong" class="quantity form-control input-number" value="{{ $data->soLuong }}" min="0" max="{{ $user->id_VaiTro < 4 ? 5 : 3 }}" data-id="{{ $data->id_ChiTietGioSach }}" data-price="{{ $data->giaTien }}">
                                        <span class="input-group-btn ml-2">
                                            <button type="button" class="quantity-right-plus btn" data-type="plus" data-id="{{ $data->id_ChiTietGioSach }}">
                                                <i class="ion-ios-add"></i>
                                            </button>
                                        </span>
                                    </div>
                                </td>
                                <td class="total" id="total-{{ $data->id_ChiTietGioSach }}" data-price="{{ $data->giaTien }}">
                                    {{ number_format($data->giaTien * $data->soLuong, 0, ',', '.') }}₫
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="row justify-content-end">
            <div class="col col-lg-4 col-md-6 mt-5 d-flex justify-content-between cart-wrap ftco-animate">
                <form id="cart-form" method="POST" action="{{ route('editCart') }}">
                    @csrf
                    <input type="hidden" name="update_cart" value="1">
                    <p class="text-center">
                        <button type="submit" id="update-cart-btn" class="btn btn-primary py-3 px-4">Cập nhật số lượng</button>
                    </p>
                </form>
                <p class="text-center">
                    <a href="checkout.html" class="btn btn-black py-3 px-4">Mượn sách</a>
                </p>
            </div>
        </div>
    </div>
</section>
<script>
    document.addEventListener('DOMContentLoaded', function() {

        var updateCartBtn = document.getElementById('update-cart-btn');
        var quantityInputs = document.querySelectorAll('.quantity');


        // Cập nhật tổng tiền khi số lượng thay đổi
        quantityInputs.forEach(function(input) {
            input.addEventListener('input', function() {
                var cartId = input.getAttribute('data-id');
                var soLuong = parseInt(input.value, 10);
                var giaTien = parseFloat(input.getAttribute('data-price'));
                var maxQuantity = parseInt(input.getAttribute('max'), 10);
                var totalElement = document.getElementById(`total-${cartId}`);

                if (!isNaN(soLuong) && giaTien) {
                    if (soLuong > maxQuantity) {
                        alert('Số lượng không được vượt quá số lượng tối đa!');
                        input.value = maxQuantity;
                        soLuong = maxQuantity;
                    }
                    // Cập nhật tổng tiền khi số lượng thay đổi
                    var total = soLuong * giaTien;
                    totalElement.innerText = `${total.toLocaleString()}₫`;
                }
            });
        });

        // Xử lý sự kiện khi nhấn nút cập nhật giỏ hàng
        updateCartBtn.addEventListener('click', function(e) {
            e.preventDefault();

            var formData = new FormData();
            formData.append('_token', '{{ csrf_token() }}');
            formData.append('update_cart', '1');

            var cartItems = Array.from(quantityInputs).map(input => {
                var cartId = input.getAttribute('data-id');
                var soLuong = parseInt(input.value, 10);

                if (soLuong <= 0) {
                    var row = document.querySelector(`tr[data-id="${cartId}"]`);
                    if (row) {
                        row.remove();
                    }
                    return {
                        id_ChiTietGioSach: cartId,
                        soLuong: soLuong
                    };
                }
                return !isNaN(soLuong) ? {
                    id_ChiTietGioSach: cartId,
                    soLuong: soLuong
                } : null;
            }).filter(item => item !== null);

            if (cartItems.length > 0) {
                formData.append('cart_items', JSON.stringify(cartItems));

                fetch('{{ route("editCart") }}', {
                        method: 'POST',
                        body: formData
                    })
                    .then(response => response.json())
                    .then(data => {
                        console.log('Update Response Data:', data);

                        if (data.success) {
                            quantityInputs.forEach(input => {
                                var cartId = input.getAttribute('data-id');
                                var totalElement = document.getElementById(`total-${cartId}`);
                                if (data.totals && data.totals[cartId]) {
                                    totalElement.innerText = data.totals[cartId];
                                }
                            });

                            // Xóa các dòng bị loại bỏ từ giỏ hàng
                            if (Array.isArray(data.removedItems)) {
                                data.removedItems.forEach(itemId => {
                                    var row = document.querySelector(`tr[data-id="${itemId}"]`);
                                    if (row) {
                                        row.remove();
                                    }
                                });
                            }
                        } else {
                            alert(data.message || 'Có lỗi xảy ra!');
                        }
                    })
                    .catch(error => console.error('Error:', error));
            } else {
                console.log('Không có sản phẩm nào để cập nhật!');
            }
        });

        // Xử lý sự kiện khi nhấn nút xóa sản phẩm
        document.addEventListener('click', function(e) {
            if (e.target && e.target.matches('.product-remove a')) {
                e.preventDefault();
                var row = e.target.closest('tr');
                var cartId = e.target.getAttribute('data-id');

                var formData = new FormData();
                formData.append('_token', '{{ csrf_token() }}');
                formData.append('remove_item', '1');
                formData.append('id_ChiTietGioSach', cartId);

                fetch('{{ route("deleteCart") }}', {
                        method: 'POST',
                        body: formData
                    })
                    .then(response => response.json())
                    .then(data => {
                        console.log('Delete Response Data:', data);

                        if (data.success) {
                            row.remove();
                        } else {
                            alert(data.message || 'Có lỗi xảy ra!');
                        }
                    })
                    .catch(error => console.error('Error:', error));
            }
        });
    });
</script>
<script src="{{asset('pages/js/numberCart.js')}}"></script>
@endsection