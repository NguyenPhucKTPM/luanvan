@extends('pages.main')
@section('layouts')
<section class="ftco-section">
    <div class="container">
        <form action="{{route('borrowBook')}}" method="post" class="billing-form">
            <div class="row justify-content-center">
                <div class="col-xl-10 ftco-animate">
                    @csrf
                    <h3 class="mb-4 billing-heading">Thông tin mượn sách</h3>
                    <div class="row align-items-end">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="hoTen">Họ tên</label>
                                <input type="text" id="hoTen" class="form-control" value="{{$user->tenNguoiDung}}">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="SDT">Số điện thoại</label>
                                <input type="text" id="SDT" class="form-control" value="0{{$user->SDT}}">
                            </div>
                        </div>
                        <div class="w-100"></div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="diaChi">Địa chỉ (có thể thay đổi)</label>
                                <textarea class="form-control" id="diaChi" rows="3" name="diaChi">{{$user->diaChi}}</textarea>
                                @if($errors->has('diaChi'))
                                <span class="text-danger"><i>*{{$errors->first('diaChi')}}</i></span>
                                @endif
                            </div>
                        </div>
                        <div class="w-100"></div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="ghiChuPhieuMuon">Ghi chú (tùy chọn)</label>
                                <textarea class="form-control" id="ghiChuPhieuMuon" rows="3" name="ghiChuPhieuMuon"></textarea>
                            </div>
                        </div>

                    </div>
                    <div class="row mt-5 pt-3">
                        <div class="col-md-6 d-flex align-items-stretch">
                            <div class="cart-detail cart-total bg-light p-3 p-md-4 w-100" id="remote-content" style="display: none;">
                                <h3 class="billing-heading mb-4">Sách được mượn</h3>
                                @foreach ( $myCart as $data )
                                <p class="d-flex">
                                    <span class="col-8 col-md-8">{{$data->tenSach}}</span>
                                    <span class="col-1 col-md-1">{{$data->soLuong}}</span>
                                    <span class="col-3 col-md-3"> {{ number_format($data->giaTien * $data->soLuong, 0, ',', '.') }}₫</span>
                                </p>
                                @endforeach
                                <p class="d-flex">
                                    <span class="col-8 col-md-8">Phí ship</span>
                                    <span class="col-1 col-md-1"></span>
                                    <span class="col-3 col-md-3">40.000₫</span>
                                </p>
                                <hr>
                                <p class="d-flex total-price">
                                    <span class="col-8 col-md-8">Tổng cộng</span>
                                    <span class="col-1 col-md-1"></span>
                                    <span class="col-3 col-md-3"> {{ number_format($totalPrice + 40000, 0, ',', '.') }}₫</span>
                                </p>
                            </div>
                        </div>
                        <div class="col-md-6 d-flex align-items-stretch">
                            <div class="cart-detail bg-light p-3 p-md-4 d-flex flex-column">
                                <h3 class="billing-heading mb-4">Phương thức mượn</h3>
                                <div class="form-group flex-grow-1">
                                    <div class="col-md-12">
                                        <div class="radio">
                                            <label><input type="radio" name="methodBorrow" class="mr-2" value="school" checked> Mượn tại trường</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group flex-grow-1">
                                    <div class="col-md-12">
                                        <div class="radio">
                                            <label><input type="radio" name="methodBorrow" class="mr-2" value="remote"> Mượn từ xa (thanh toán qua Momo)</label>
                                        </div>
                                    </div>
                                    @if($errors->has('methodBorrow'))
                                    <div class="col-md-12">
                                        <span class="text-danger"><i>*{{$errors->first('methodBorrow')}}</i></span>
                                    </div>
                                    @endif
                                </div>
                                <p class="mt-auto"><button type="submit" class="btn btn-primary py-3 px-4">Xác nhận mượn</button></p>
                            </div>
                        </div>
                    </div>
                </div>
        </form>
    </div>
</section>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const remoteContent = document.getElementById('remote-content');
        const radios = document.getElementsByName('methodBorrow');

        function updateDisplay() {
            if (document.querySelector('input[name="methodBorrow"]:checked').value === 'remote') {
                remoteContent.style.display = 'block';
            } else {
                remoteContent.style.display = 'none';
            }
        }

        radios.forEach(radio => {
            radio.addEventListener('change', updateDisplay);
        });
        updateDisplay();
    });
</script>
@endsection