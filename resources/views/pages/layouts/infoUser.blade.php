@extends('pages.index')
@section('content')
<div class="hero-wrap hero-bread" style="background-image: url('pages/images/bg_6.jpg');">
    <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center fadeInUp ftco-animated">
                <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Người dùng</a></span>
                </p>
                <h1 class="mb-0 bread">Chi tiết thông tin</h1>
            </div>
        </div>
    </div>
</div>

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
                                <div class="user-info mb-1">
                                    <h4 class="mb-0">Eleanor Aguilar</h4>
                                    <span class="card-text">eleanor.aguilar@gmail.com</span>
                                </div>
                                <div class="d-flex justify-content-between flex-wrap">
                                    <a href="./app-user-edit.html"
                                        class="btn btn-primary waves-effect waves-float waves-light">Cập nhật</a>
                                    <button class="btn btn-outline-success ms-1 waves-effect ms-2">Xác nhận
                                        Email</button>
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
                            <p class="card-text mb-0">Nguyễn Nhâm Phúc</p>
                        </div>

                        <div class="d-flex  flex-wrap ">
                            <div class="user-info-title">
                                <i class="fas fa-venus-mars" style="width: 15px; height:15px;"></i>
                                <span class="card-text user-info-title fw-bold mb-0" style="margin-left: 1rem;">Giới
                                    tính</span>
                            </div>
                            <p class="card-text mb-0">Nam</p>
                        </div>

                        <div class="d-flex flex-wrap ">
                            <div class="user-info-title">
                                <i class="far fa-check-circle" style="width: 15px; height:15px;"></i>
                                <span class="card-text user-info-title fw-bold mb-0" style="margin-left: 1rem;">Trang
                                    thái</span>
                            </div>
                            <p class="card-text mb-0">Đã kích hoạt Email</p>
                        </div>
                        <div class="d-flex flex-wrap my-50">
                            <div class="user-info-title">
                                <i class="far fa-bookmark" style="width: 15px; height:15px;"></i>
                                <span class="card-text user-info-title fw-bold mb-0" style="margin-left: 1rem;">Vai
                                    trò</span>
                            </div>
                            <p class="card-text mb-0">Quản trị viên</p>
                        </div>
                        <div class="d-flex flex-wrap my-50">
                            <div class="user-info-title">
                                <i class="fas fa-map-marker-alt" style="width: 15px; height:15px;"></i>
                                <span class="card-text user-info-title fw-bold mb-0" style="margin-left: 1rem;">Địa
                                    chỉ</span>
                            </div>
                            <p class="card-text mb-0">Long Thạnh, Phụng Hiệp, Hậu Giang</p>
                        </div>
                        <div class="d-flex flex-wrap">
                            <div class="user-info-title">
                                <i class="fas fa-phone-alt" style="width: 15px; height:15px;"> </i>
                                <span class="card-text user-info-title fw-bold mb-0" style="margin-left: 1rem;">Số
                                    điện
                                    thoại</span>
                            </div>
                            <p class="card-text mb-0">0852 34 8684</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    </div>
</section>
@endsection