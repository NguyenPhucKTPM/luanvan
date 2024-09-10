@extends('pages.main')
@section('layouts')


<section class="ftco-section ">
    <div class=" container">
        <div class="card-body">
            <div class="row">
                <div class="col-xl-6 col-lg-12 d-flex flex-column justify-content-between border-container-lg">
                    <div class="user-avatar-section">
                        <div class="d-flex justify-content-start">
                            <img class="img-fluid rounded " src="app-assets/images/avatars/7.png" height="104"
                                width="104" alt="User avatar">
                            <div class="d-flex flex-column ms-1 info-card">
                                <div class="user-info mb-2">
                                    <h4 class="mb-0">{{$userInfo -> tenNguoiDung}}
                                    </h4>
                                    <span class="card-text">{{$userInfo -> email}}</span>
                                </div>
                                <div class="d-flex justify-content-start flex-wrap">
                                    <a href="{{route('thay-doi')}}"
                                        class="btn btn-primary waves-effect waves-float waves-light mr-2">Cập
                                        nhật</a>
                                    @if($userInfo -> id_TrangThai == 1)
                                    <form action="{{ route('confirmEmail') }}" method="POST">
                                        @csrf
                                        <button class="btn btn-outline-success ms-1 waves-effect ms-2">Xác nhận
                                            Email</button>
                                    </form>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="d-flex align-items-center user-total-numbers">
                        <div class="d-flex align-items-center me-2" style="margin-right: 2rem;">
                            <div class="color-box bg-light-primary">
                                <i class="fas fa-book" style="width: 15px; height:15px;"></i>
                            </div>
                            <div class="ml-3">
                                <h5 class="mb-0" style="line-height: 0.5;color: #0e4582;">1</h5>
                                <small>Số lần mượn </small>
                            </div>
                        </div>

                        <div class="d-flex align-items-center">
                            <div class="color-box bg-light-success" style="background: #ffc5c5;">
                                <i class="fas fa-exclamation" style="color: red;"></i>
                            </div>
                            <div class="ml-3">
                                <h5 class="mb-0" style="line-height: 0.5;color: red;">0</h5>
                                <small>Số vi phạm</small>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="col-xl-6 col-lg-12 mt-2 mt-xl-0">
                    <div class="user-info-wrapper">
                        <div class="d-flex  flex-wrap ">
                            <div class="user-info-title">
                                <i class="far fa-user" style="width: 15px; height:15px;"></i>
                                <span class="card-text user-info-title fw-bold mb-0" style="margin-left: 1rem;">Họ
                                    tên</span>
                            </div>
                            <p class="card-text mb-0">{{$userInfo -> tenNguoiDung}} -
                                {{$userInfo -> id_VaiTro == 1 ? $userInfo -> tenVaiTro : ''}}
                            </p>
                        </div>
                        @if(isset ($infoRole))
                        <div class="user-info-wrapper">
                            <div class="d-flex  flex-wrap ">
                                <div class="user-info-title">
                                    <i class="far fa-bookmark" style="width: 15px; height:15px;"></i>
                                    <span class="card-text user-info-title fw-bold mb-0" style="margin-left: 1rem;">
                                        {{$userInfo -> id_VaiTro == 3 ? 'Mã giảng viên' : 'Mã sinh viên' }}
                                    </span>
                                </div>
                                <p class="card-text mb-0">
                                    {{$userInfo -> id_VaiTro == 3 ? $infoRole -> maGiangVien : $infoRole -> maSinhVien }}
                                </p>
                            </div>
                            @endif
                            <div class="d-flex  flex-wrap ">
                                <div class="user-info-title">
                                    <i class="fas fa-birthday-cake" style="width: 15px; height:15px;"></i>
                                    <span class="card-text user-info-title fw-bold mb-0" style="margin-left: 1rem;">Ngày
                                        sinh</span>
                                </div>
                                <p class="card-text mb-0">{{$userInfo -> ngaySinh}}</p>
                            </div>

                            <div class="d-flex  flex-wrap ">
                                <div class="user-info-title">
                                    <i class="fas fa-venus-mars" style="width: 15px; height:15px;"></i>
                                    <span class="card-text user-info-title fw-bold mb-0" style="margin-left: 1rem;">Giới
                                        tính</span>
                                </div>
                                <p class="card-text mb-0">{{$userInfo -> gioiTinh}}</p>
                            </div>

                            <div class="d-flex flex-wrap ">
                                <div class="user-info-title">
                                    <i class="far fa-check-circle" style="width: 15px; height:15px;"></i>
                                    <span class="card-text user-info-title fw-bold mb-0"
                                        style="margin-left: 1rem;">Trang
                                        thái</span>
                                </div>
                                <p class="card-text mb-0">{{$userInfo -> tenTrangThai}}</p>
                            </div>
                        </div>
                        <div class="d-flex flex-wrap my-50">
                            <div class="user-info-title">
                                <i class="fas fa-map-marker-alt" style="width: 15px; height:15px;"></i>
                                <span class="card-text user-info-title fw-bold mb-0" style="margin-left: 1rem;">Địa
                                    chỉ</span>
                            </div>
                            <p class="card-text mb-0">{{$userInfo -> diaChi}}</p>
                        </div>
                        <div class="d-flex flex-wrap">
                            <div class="user-info-title">
                                <i class="fas fa-phone-alt" style="width: 15px; height:15px;"> </i>
                                <span class="card-text user-info-title fw-bold mb-0" style="margin-left: 1rem;">Số
                                    điện
                                    thoại</span>
                            </div>
                            <p class="card-text mb-0">0{{$userInfo -> SDT}}</p>
                        </div>
                        @if(isset ($infoRole))
                        <div class="d-flex flex-wrap">
                            <div class="user-info-title">
                                <i class="fas fa-city" style="width: 15px; height:15px;"> </i>
                                <span class="card-text user-info-title fw-bold mb-0"
                                    style="margin-left: 1rem;">Khoa</span>
                            </div>
                            <p class="card-text mb-0">{{ $infoRole->tenKhoa ?? 'Chưa có thông tin' }}</p>
                        </div>

                        @if ($userInfo->id_VaiTro == 4)
                        <div class="d-flex flex-wrap">
                            <div class="user-info-title">
                                <i class="fas fa-suitcase" style="width: 15px; height:15px;"> </i>
                                <span class="card-text user-info-title fw-bold mb-0" style="margin-left: 1rem;">Khóa
                                    học</span>
                            </div>
                            <p class="card-text mb-0">{{ $infoRole->tenKhoaHoc ?? 'Chưa có thông tin' }}</p>
                        </div>
                        <div class="d-flex flex-wrap">
                            <div class="user-info-title">
                                <i class="fab fa-buromobelexperte" style="width: 15px; height:15px;"> </i>
                                <span class="card-text user-info-title fw-bold mb-0" style="margin-left: 1rem;">Lớp
                                    học</span>
                            </div>
                            <p class="card-text mb-0">{{ $infoRole->tenLop ?? 'Chưa có thông tin' }}</p>
                        </div>
                        @endif
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    </div>
</section>
@endsection