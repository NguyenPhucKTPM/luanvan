@extends('admin.main')
@section('layouts')
<style>
    .user-info-title {
        width: 11.785rem;
    }
</style>
<section class="app-user-edit">
    <div class="card">
        <div class="card-body">
            <ul class="nav nav-pills" role="tablist">
                <li class="nav-item">
                    <a
                        class="nav-link d-flex align-items-center active"
                        id="account-tab"
                        data-bs-toggle="tab"
                        href="#account"
                        aria-controls="account"
                        role="tab"
                        aria-selected="true">
                        <i data-feather="user"></i><span class="d-none d-sm-block">Thông tin chi tiết</span>
                    </a>
                </li>
                <!-- <li class="nav-item">
                    <a
                        class="nav-link d-flex align-items-center"
                        id="information-tab"
                        data-bs-toggle="tab"
                        href="#information"
                        aria-controls="information"
                        role="tab"
                        aria-selected="false">
                        <i data-feather="refresh-ccw"></i><span class="d-none d-sm-block">Cập nhật thông tin</span>
                    </a>
                </li> -->
            </ul>
            <div class="tab-content">
                <!-- Account Tab starts -->
                <div class="tab-pane active" id="account" aria-labelledby="account-tab" role="tabpanel">
                    <div class="d-flex mb-2">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-xl-6 col-lg-12 d-flex flex-column justify-content-between border-container-lg">
                                    <div class="user-avatar-section">
                                        <div class="d-flex mb-1 justify-content-start">
                                            <img class="img-fluid rounded" src="{{asset('app-assets/images/avatars/4.png')}}"
                                                height="104" width="104" alt="User avatar">
                                            <div class="d-flex flex-column ms-1">
                                                <div class="user-info mb-1">
                                                    <h4 class="mb-0">{{$userDetail -> tenNguoiDung}}</h4>
                                                    <!-- <span class="card-text">{{$userDetail -> email}}</span> -->
                                                </div>
                                                <div class="d-flex flex-wrap">
                                                    <!-- <a href="./app-user-edit.html" class="btn btn-primary waves-effect waves-float waves-light">Edit</a>
                                                    <button class="btn btn-outline-danger ms-1 waves-effect">Delete</button> -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center user-total-numbers">
                                        <div class="d-flex align-items-center me-2">
                                            <div class="d-flex align-items-center justify-content-center color-box bg-light-info "
                                                style="height: 2.714rem;width: 2.714rem; border-radius:5px;">
                                                <i data-feather='book'></i>
                                            </div>
                                            <div class="ms-1">
                                                <h5 class="mb-0">{{$userDetail -> soLanMuonSach}}</h5>
                                                <small>Số lần mượn</small>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-center">
                                            <div class="d-flex align-items-center justify-content-center color-box bg-light-danger"
                                                style="height: 2.714rem;width: 2.714rem; border-radius:5px;">
                                                <i data-feather='alert-circle'></i>
                                            </div>
                                            <div class="ms-1">
                                                <h5 class="mb-0">{{$userDetail -> soViPham}}</h5>
                                                <small>Số lần vi phạm</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-12 mt-2 mt-xl-0">
                                    <div class="user-info-wrapper">
                                        <div class="d-flex flex-wrap">
                                            <div class="user-info-title">
                                                <i data-feather='user' class="me-1"></i>
                                                <span class="card-text user-info-title fw-bold mb-0">Họ tên</span>
                                            </div>
                                            <p class="card-text mb-0">{{$userDetail -> tenNguoiDung}}</p>
                                        </div>
                                        @if($student)
                                        <div class="d-flex flex-wrap my-50">
                                            <div class="user-info-title">
                                                <i data-feather='bookmark' class="me-1"></i>
                                                <span class="card-text user-info-title fw-bold mb-0">Mã sinh viên</span>
                                            </div>
                                            <p class="card-text mb-0">{{$student -> maSinhVien}}</p>
                                        </div>
                                        @elseif($lecturer)
                                        <div class="d-flex flex-wrap my-50">
                                            <div class="user-info-title">
                                                <i data-feather='bookmark' class="me-1"></i>
                                                <span class="card-text user-info-title fw-bold mb-0">Mã giảng viên</span>
                                            </div>
                                            <p class="card-text mb-0">{{$lecturer -> maGiangVien}}</p>
                                        </div>
                                        @if($librarian)
                                        <div class="d-flex flex-wrap my-50">
                                            <div class="user-info-title">
                                                <i data-feather='key' class="me-1"></i>
                                                <span class="card-text user-info-title fw-bold mb-0">Mã thủ thư</span>
                                            </div>
                                            <p class="card-text mb-0">{{$librarian -> maThuThu}} {{$userDetail -> id_VaiTro == 3 ? '(đã từng làm)' : ''}}</p>
                                        </div>
                                        @endif
                                        @endif
                                        <div class="d-flex flex-wrap">
                                            <div class="user-info-title">
                                                <i data-feather='navigation' class="me-1"></i>
                                                <span class="card-text user-info-title fw-bold mb-0">Email</span>
                                            </div>
                                            <p class="card-text mb-0">{{$userDetail -> email}}</p>
                                        </div>
                                        <div class="d-flex flex-wrap my-50">
                                            <div class="user-info-title">
                                            <i class="fas fa-venus-mars " style="height: 1rem; width:1rem; margin-right:14px;"></i>
                                                <span class="card-text user-info-title fw-bold mb-0">Giới tính</span>
                                            </div>
                                            <p class="card-text mb-0">{{$userDetail -> gioiTinh}}</p>
                                        </div>
                                        <div class="d-flex flex-wrap my-50">
                                            <div class="user-info-title">
                                                <i data-feather='check-circle' class="me-1"></i>
                                                <span class="card-text user-info-title fw-bold mb-0">Trạng thái</span>
                                            </div>
                                            <p class="card-text mb-0">{{$userDetail -> id_TrangThai == 1 ? 'Chưa xác nhận' : 'Đã xác nhận'}}</p>
                                        </div>
                                        <div class="d-flex flex-wrap my-50">
                                            <div class="user-info-title">
                                                <i data-feather='map-pin' class="me-1"></i>
                                                <span class="card-text user-info-title fw-bold mb-0">Địa chỉ</span>
                                            </div>
                                            <p class="card-text mb-0">{{$userDetail -> diaChi}}</p>
                                        </div>
                                        <div class="d-flex flex-wrap my-50">
                                            <div class="user-info-title">
                                                <i data-feather='phone' class="me-1"></i>
                                                <span class="card-text user-info-title fw-bold mb-0">Số điện thoại</span>
                                            </div>
                                            <p class="card-text mb-0">0{{$userDetail -> SDT}}</p>
                                        </div>
                                        @if($student)
                                        <div class="d-flex flex-wrap my-50">
                                            <div class="user-info-title">
                                                <i data-feather='layers' class="me-1"></i>
                                                <span class="card-text user-info-title fw-bold mb-0">Khoa</span>
                                            </div>
                                            <p class="card-text mb-0">{{$student -> tenKhoa}}</p>
                                        </div>
                                        <div class="d-flex flex-wrap my-50">
                                            <div class="user-info-title">
                                                <i data-feather='flag' class="me-1"></i>
                                                <span class="card-text user-info-title fw-bold mb-0">Khóa học</span>
                                            </div>
                                            <p class="card-text mb-0">{{$student -> tenKhoaHoc}}</p>
                                        </div>
                                        <div class="d-flex flex-wrap my-50">
                                            <div class="user-info-title">
                                                <i data-feather='grid' class="me-1"></i>
                                                <span class="card-text user-info-title fw-bold mb-0">Lớp</span>
                                            </div>
                                            <p class="card-text mb-0">{{$student -> tenLop}}</p>
                                        </div>
                                        @elseif($lecturer || $librarian)
                                        <div class="d-flex flex-wrap my-50">
                                            <div class="user-info-title">
                                                <i data-feather='layers' class="me-1"></i>
                                                <span class="card-text user-info-title fw-bold mb-0">Khoa</span>
                                            </div>
                                            <p class="card-text mb-0">{{$lecturer -> tenKhoa}}</p>
                                        </div>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Account Tab ends -->
            </div>
        </div>
    </div>
</section>
@endsection