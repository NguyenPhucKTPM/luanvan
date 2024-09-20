@extends('admin.main')
@section('layouts')
<div class="ecommerce-application">
    <div class="content-body">
        <div class="bs-stepper checkout-tab-steps">
            <div class="bs-stepper-content">
                <!-- Checkout Place order starts -->
                <!-- <div id="step-cart" class="content" role="tabpanel" aria-labelledby="step-cart-trigger"> -->
                <div id="place-order" class="list-view product-checkout">
                    <!-- Checkout Place Order Left starts -->
                    <div class="checkout-items">
                        @foreach ($getDetailBorrow as $data )
                        <div class="card ecommerce-card">
                            <div class="item-img">
                                <a href="app-ecommerce-details.html">
                                    <img src="{{$data -> duongDan}}" alt="img-placeholder" />
                                </a>
                            </div>
                            <div class="card-body">
                                <div class="item-name">
                                    <h6 class="mb-0"><a href="{{route('detailBook',[$data -> id_Sach])}}" class="text-body">{{$data -> tenSach}}</a></h6>
                                    <span class="item-company">Số lượng còn sẵn: <a href="#" class="company-name">{{$data -> soLuongCoSan}}</a></span>
                                    <div class="item-rating">
                                        <ul class="unstyled-list list-inline">
                                            @php
                                            $averageRating = min($data->danhGiaTrungBinh, 5);
                                            @endphp
                                            @for ($i = 1; $i <= 5; $i++)
                                                @if ($i <=$averageRating)
                                                <li class="ratings-list-item"><i data-feather="star" class="filled-star"></i></li>
                                                @else
                                                <li class="ratings-list-item"><i data-feather="star" class="unfilled-star"></i></li>
                                                @endif
                                                @endfor
                                        </ul>
                                    </div>
                                </div>
                                <span class="text-success mb-1">Còn sẵn trong ngăn</span>
                                <div class="item-quantity mt-3">
                                    <span class="quantity-title">Số lượng mượn:</span>
                                    <div class="quantity-counter-wrapper">
                                        <div class="input-group ">
                                            <input type="text" class="quantity-counter" value="{{$data->soLuongSachMuon}}" disabled>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="item-options text-center">
                                <div class="item-wrapper">
                                    <div class="item-cost">
                                        <h4 class="item-price">{{ number_format($data->giaTien, 0, ',', '.') }}₫</h4>
                                    </div>
                                </div>
                                <p class="card-text shipping">
                                    <span class="badge rounded-pill badge-light-success">{{ $getBorrow -> hinhThucMuon }}</span>
                                </p>
                            </div>
                        </div>
                        @endforeach

                    </div>
                    <div class="checkout-options">
                        @if($getBorrow -> trangThaiPhieuMuon == 3)
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Trả sách</h4>
                                <hr />
                                <form action="{{route('returnBorrow')}}" method="post">
                                    @csrf
                                    <div class="d-flex flex-column mb-2">
                                        <label class="form-check-label mb-50" for="koViPham">Không vi phạm</label>
                                        <div class="form-check form-check-success form-switch">
                                            <input name="koViPham" value="1" type="checkbox" class="form-check-input" id="koViPham" />
                                        </div>
                                    </div>
                                    <div class="d-flex flex-column mb-2">
                                        <label class="form-check-label mb-50" for="treHan">Trễ hạn</label>
                                        <div class="form-check form-check-secondary form-switch">
                                            <input name="viPham[]" value="2" type="checkbox" class="form-check-input" id="treHan" />
                                        </div>
                                    </div>
                                    <div class="d-flex flex-column mb-2">
                                        <label class="form-check-label mb-50" for="lamHong">Làm hỏng sách</label>
                                        <div class="form-check form-check-warning form-switch">
                                            <input name="viPham[]" value="4" type="checkbox" class="form-check-input" id="lamHong" />
                                        </div>
                                    </div>
                                    <div class="d-flex flex-column mb-2">
                                        <label class="form-check-label mb-50" for="matSach">Làm mất sách</label>
                                        <div class="form-check form-check-danger form-switch">
                                            <input name="viPham[]" value="3" type="checkbox" class="form-check-input" id="matSach" />
                                        </div>
                                    </div>
                                    <input type="hidden" name="id_PhieuMuon" value="{{ Crypt::encrypt($getBorrow->id_PhieuMuon) }}">
                                    <input type="hidden" name="id_NguoiDung" value="{{ Crypt::encrypt($getBorrow->id_NguoiDung) }}">

                                    <div class="d-flex flex-column mb-2">
                                        <button type="submit" class="btn btn-gradient-primary">Trả sách</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        @endif
                        <div class="card">
                            <div class="card-body">
                                <div class="row d-flex">
                                    <div class="col-md-6 col-6">
                                        <h4 class="card-title">Chi tiết phiếu mượn</h4>
                                    </div>
                                    <div class="col-md-6 col-6 text-end">
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-primary waves-effect waves-float waves-light">{{$statusBorrow}}</button>
                                            <button type="button" class="btn btn-primary dropdown-toggle dropdown-toggle-split waves-effect waves-float waves-light" data-bs-toggle="dropdown" aria-expanded="false">
                                                <span class="visually-hidden">Toggle Dropdown</span>
                                            </button>
                                            @if($getBorrow -> trangThaiPhieuMuon == 0)
                                            <div class="dropdown-menu dropdown-menu-end">
                                                <a class="dropdown-item" href="{{ route('approveBorrow', ['status' =>  Crypt::encrypt(1), 'id' => Crypt::encrypt($getBorrow->id_PhieuMuon)]) }}">Duyệt phiếu mượn</a>
                                                <a class="dropdown-item" href="{{ route('approveBorrow', ['status' => Crypt::encrypt(2), 'id' => Crypt::encrypt($getBorrow->id_PhieuMuon)]) }}">Hủy phiếu mượn</a>
                                            </div>
                                            @elseif($getBorrow -> trangThaiPhieuMuon == 1)
                                            <div class="dropdown-menu dropdown-menu-end">
                                                <a class="dropdown-item" href="{{ route('approveBorrow', ['status' => Crypt::encrypt(3), 'id' => Crypt::encrypt($getBorrow->id_PhieuMuon)]) }}">Cho mượn sách</a>
                                            </div>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                                <hr />
                                <div class="card-body actions">
                                    <p class="card-text">Mã phiếu mượn: <strong>{{$getBorrow -> maPhieuMuon}} </strong></p>
                                    <p class="card-text">Họ tên: <strong>{{$getBorrow -> tenNguoiDung .' - '. $getBorrow -> tenVaiTro}} </strong></p>
                                    <p class="card-text">Số điện thoại: <strong>{{$getBorrow -> SDT}}</strong></p>
                                    <p class="card-text">Địa chỉ: <strong>{{$getBorrow -> diaChi}}</strong></p>
                                    <p class="card-text">Tiền cọc: <strong>{{ number_format($getBorrow -> tienCoc, 0, ',', '.') }}₫</strong></p>
                                    <p class="card-text">Ngày mượn: <strong> {{ \Carbon\Carbon::parse($getBorrow->ngayMuon)->format('d/m/Y') }}</strong></p>
                                    <p class="card-text">Ngày trả dự kiến: <strong> {{ \Carbon\Carbon::parse($getBorrow->ngayTraDuKien)->format('d/m/Y') }}</strong></p>
                                    @if($getBorrow -> trangThaiPhieuMuon == 4)
                                    <p class="card-text">Ngày trả thực tế: <strong> {{ \Carbon\Carbon::parse($getReturnBorrow->ngayTraThucTe)->format('d/m/Y') }}</strong></p>
                                    @endif
                                    <p class="card-text">Ghi chú: <i>{{$getBorrow -> ghiChuPhieuMuon == null ? '' : $getBorrow -> ghiChuPhieuMuon }}</i></p>
                                    @if($getBorrow -> trangThaiPhieuMuon > 0)
                                    <p class="card-text">Người duyệt đơn: <strong>{{$getBorrow -> nguoiDuyet}} </strong></p>
                                    @endif
                                </div>
                            </div>
                        </div>
                        @if($getBorrow -> trangThaiPhieuMuon == 4)
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Chi tiết phiếu trả sách</h4>
                                <hr />
                                <div class="card-body actions">
                                    <p class="card-text">Mã phiếu trả: <strong>{{$getReturnBorrow -> maPhieuTra}} </strong></p>
                                    <p class="card-text">Ngày trả thực tế: <strong> {{ \Carbon\Carbon::parse($getReturnBorrow->ngayTraThucTe)->format('d/m/Y') }}</strong></p>
                                    <p class="card-text">Người nhận sách: <strong>{{$getReturnBorrow -> nguoiNhan}} </strong></p>
                                    @if($detailMistake->isEmpty())
                                    <p class="card-text">Mô tả lỗi: <strong>Không có vi phạm </strong></p>
                                    @else
                                    @foreach ($detailMistake as $data)
                                    <p class="card-text">Mô tả lỗi: <strong>{{$data->tenViPham}}</strong></p>
                                    @endforeach
                                    @endif
                                </div>
                            </div>
                        </div>
                        @endif
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Thông tin mượn (áp dụng mượn xa)</h4>
                                <hr />
                                <div class="price-details">
                                    <ul class="list-unstyled">
                                        @foreach ($getDetailBorrow as $data )
                                        <li class="price-detail">
                                            <div class="detail-title">{{$data->tenSach. '  x' .$data -> soLuongSachMuon}}</div>
                                            <div class="detail-amt">{{ number_format($data->giaTien * $data->soLuongSachMuon, 0, ',', '.') }}₫</div>
                                            @endforeach
                                        <li class="price-detail">
                                            <div class="detail-title">Phí vận chuyển</div>
                                            <div class="detail-amt discount-amt ">40.000₫</div>
                                        </li>
                                    </ul>
                                    <hr />
                                    <ul class="list-unstyled">
                                        <li class="price-detail">
                                            <div class="detail-title detail-total">Tổng cộng</div>
                                            <div class="detail-amt fw-bolder">{{ number_format($tong + 40000, 0, ',', '.') }}₫</div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    // Lấy checkbox "Không vi phạm"
    const koViPhamCheckbox = document.getElementById('koViPham');

    // Lấy tất cả các checkbox khác
    const otherCheckboxes = ['treHan', 'lamHong', 'matSach'].map(id => document.getElementById(id));

    // Gắn sự kiện cho checkbox "Không vi phạm"
    koViPhamCheckbox.addEventListener('change', function() {
        // Kiểm tra trạng thái checked của "Không vi phạm"
        const isChecked = this.checked;

        // Vô hiệu hóa và bỏ chọn các checkbox khác nếu "Không vi phạm" được chọn
        otherCheckboxes.forEach(checkbox => {
            checkbox.disabled = isChecked;
            if (isChecked) {
                checkbox.checked = false;
            }
        });
    });
</script>
@endsection