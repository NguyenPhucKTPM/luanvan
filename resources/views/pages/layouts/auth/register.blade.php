<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=0,minimal-ui">
    <meta name="description"
        content="Vuexy admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
    <meta name="keywords"
        content="admin template, Vuexy admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="PIXINVENT">
    <title>Đăng ký</title>
    <link rel="apple-touch-icon" href="app-assets/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="pages/images/logo.png">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;1,400;1,500;1,600"
        rel="stylesheet">

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/css/vendors.min.css">
    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css" href="app-assets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/bootstrap-extended.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/colors.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/components.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/themes/dark-layout.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/themes/bordered-layout.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/themes/semi-dark-layout.css">

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="app-assets/css/core/menu/menu-types/vertical-menu.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/plugins/forms/form-validation.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/pages/page-auth.css">
    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/core/menu/menu-types/vertical-menu.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/plugins/forms/pickers/form-flat-pickr.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/plugins/forms/pickers/form-pickadate.css">
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/css/pickers/pickadate/pickadate.css">
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/css/pickers/flatpickr/flatpickr.min.css">
    <!-- END: Custom CSS-->



</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body class="vertical-layout vertical-menu-modern blank-page navbar-floating footer-static  " data-open="click"
    data-menu="vertical-menu-modern" data-col="blank-page">
    <!-- BEGIN: Content-->
    <div class="app-content content ">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row">
            </div>
            <div class="content-body">
                <div class="auth-wrapper auth-v1 px-2">
                    <div class="auth-inner py-2">
                        <!-- Register v1 -->
                        <div class="card mb-0">
                            <div class="card-body">
                                <a href="{{route('home')}}" class="brand-logo">
                                    <img src="pages/images/logo_ctut1.png" alt="">

                                </a>
                                <h4 class="card-title mb-1">Đăng ký</h4>

                                <form class="auth-register-form mt-2" action="{{ route('register') }}" method="POST">
                                    @csrf
                                    <!-- email -->
                                    <div class="mb-1">
                                        <label for="register-email" class="form-label">Địa chỉ email</label>
                                        <input type="text" class="form-control" id="email" name="email"
                                            placeholder="phuc@example.com" aria-describedby="email" tabindex="2" />
                                        @if($errors->has('email'))
                                        <span class="error-message text-danger">*
                                            {{$errors->first('email')}}</span>
                                        @endif
                                    </div>


                                    <!-- mat khau -->
                                    <div class="mb-1">
                                        <label for="password" class="form-label">Mật khẩu</label>
                                        <div class="input-group input-group-merge form-password-toggle">
                                            <input type="password" class="form-control form-control-merge" id="password"
                                                name="password"
                                                placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
                                                aria-describedby="password" tabindex="3" />
                                            <span class="input-group-text cursor-pointer"><i
                                                    data-feather="eye"></i></span>
                                        </div>
                                        @if($errors->has('password'))
                                        <span class="error-message text-danger">*
                                            {{$errors->first('password')}}</span>
                                        @endif
                                    </div>

                                    <!-- xac nhan mat khau -->
                                    <div class="mb-1">
                                        <label for="rePassword" class="form-label">Xác nhận mật khẩu</label>
                                        <div class="input-group input-group-merge form-password-toggle">
                                            <input type="password" class="form-control form-control-merge"
                                                id="rePassword" name="rePassword"
                                                placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
                                                aria-describedby="rePassword" tabindex="3" />
                                            <span class="input-group-text cursor-pointer"><i
                                                    data-feather="eye"></i></span>
                                        </div>
                                        @if($errors->has('rePassword'))
                                        <span class="error-message text-danger">*
                                            {{$errors->first('rePassword')}}</span>
                                        @endif
                                    </div>


                                    <!-- ho ten -->
                                    <div class="mb-1">
                                        <label for="tenNguoiDung" class="form-label ">Họ tên</label>
                                        <input type="text" class="form-control " id="tenNguoiDung" name="tenNguoiDung"
                                            placeholder="Nhập họ và tên" aria-describedby="tenNguoiDung" tabindex="1"
                                            autofocus />
                                        @if($errors->has('tenNguoiDung'))
                                        <span class="error-message text-danger">*
                                            {{$errors->first('tenNguoiDung')}}</span>
                                        @endif
                                    </div>

                                    <!-- SDT -->
                                    <div class="mb-1">
                                        <label for="SDT" class="form-label ">Số điện thoại</label>
                                        <input type="text" class="form-control " id="SDT" name="SDT"
                                            placeholder="Nhập số điện thoại" aria-describedby="SDT" tabindex="1"
                                            autofocus />
                                        @if($errors->has('SDT'))
                                        <span class="error-message text-danger">*
                                            {{$errors->first('SDT')}}</span>
                                        @endif
                                    </div>

                                    <!-- ngay sinh -->
                                    <div class="mb-1">
                                        <label for="ngaySinh" class="form-label">Ngày sinh</label>
                                        <input type="text" id="fp-default" name="ngaySinh"
                                            class="form-control flatpickr-basic flatpickr-input active"
                                            placeholder="YYYY-MM-DD" readonly="readonly">
                                        @if($errors->has('ngaySinh'))
                                        <span class="error-message text-danger">*
                                            {{$errors->first('ngaySinh')}}</span>
                                        @endif
                                    </div>

                                    <!-- gioi tinh -->
                                    <div class="mb-1">
                                        <label class="form-label">Giới tính</label>
                                        <div class="d-flex justify-content-start">
                                            <div class="form-check me-3 ">
                                                <input type="radio" id="nam" name="gioiTinh" class="form-check-input"
                                                    value="Nam">
                                                <label class="form-check-label" for="nam">Nam</label>
                                            </div>
                                            <div class="form-check">
                                                <input type="radio" id="nu" name="gioiTinh" class="form-check-input"
                                                    value="Nữ">
                                                <label class="form-check-label" for="nu">Nữ</label>
                                            </div>
                                        </div>
                                        @if($errors->has('gioiTinh'))
                                        <span class="error-message text-danger">*
                                            {{$errors->first('gioiTinh')}}</span>
                                        @endif
                                    </div>
                                    <!-- Vai trò -->
                                    <div class="mb-1">
                                        <label for="id_VaiTro" class="form-label">Chọn vai trò</label>
                                        <select name="id_VaiTro" id="id_VaiTro" class="form-control">
                                            <option value="4">Sinh viên</option>
                                            <option value="3">Giảng viên</option>
                                        </select>
                                        @if($errors->has('id_VaiTro'))
                                        <span class="error-message text-danger">*
                                            {{$errors->first('id_VaiTro')}}</span>
                                        @endif
                                    </div>

                                    <!-- dia chi -->
                                    <div class="mb-1">
                                        <label class="d-block form-label" for="diaChi">Địa chỉ</label>
                                        <textarea class="form-control" id="diaChi" name="diaChi" rows="3"
                                            style="height: 52px;"></textarea>
                                        @if($errors->has('diaChi'))
                                        <span class="error-message text-danger">*
                                            {{$errors->first('diaChi')}}</span>
                                        @endif
                                    </div>

                                    <button class="btn btn-primary w-100" tabindex="5">Đăng ký</button>
                                </form>

                                <p class="text-center mt-2">
                                    <span>Bạn đã có tài khoản?</span>
                                    <a href="page-auth-login-v1.html">
                                        <span>Đăng nhập ngay</span>
                                    </a>
                                </p>

                                <!-- <div class="divider my-2">
                                    <div class="divider-text">Hoặc</div>
                                </div>

                                <div class="auth-footer-btn d-flex justify-content-center">
                                    <a href="#" class="btn btn-facebook">
                                        <i data-feather="facebook"></i>
                                    </a>
                                    <a href="#" class="btn btn-twitter white">
                                        <i data-feather="twitter"></i>
                                    </a>
                                    <a href="#" class="btn btn-google">
                                        <i data-feather="mail"></i>
                                    </a>
                                    <a href="#" class="btn btn-github">
                                        <i data-feather="github"></i>
                                    </a>
                                </div> -->
                            </div>
                        </div>
                        <!-- /Register v1 -->
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- END: Content-->


    <!-- BEGIN: Vendor JS-->
    <script src="app-assets/vendors/js/vendors.min.js"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    <script src="app-assets/vendors/js/forms/validation/jquery.validate.min.js"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="app-assets/js/core/app-menu.js"></script>
    <script src="app-assets/js/core/app.js"></script>

    <!-- END: Theme JS-->
    <script src="app-assets/vendors/js/pickers/pickadate/picker.js"></script>
    <script src="app-assets/vendors/js/pickers/pickadate/picker.date.js"></script>
    <script src="app-assets/vendors/js/pickers/pickadate/picker.time.js"></script>
    <script src="app-assets/vendors/js/pickers/pickadate/legacy.js"></script>
    <script src="app-assets/vendors/js/pickers/flatpickr/flatpickr.min.js"></script>
    <script src="app-assets/js/scripts/forms/pickers/form-pickers.js"></script>

    <script src="app-assets/js/scripts/forms/form-tooltip-valid.js"></script>
    <!-- BEGIN: Page JS-->
    <script src="app-assets/js/scripts/pages/page-auth-register.js"></script>
    <!-- END: Page JS-->

    <script>
    $(window).on('load', function() {
        if (feather) {
            feather.replace({
                width: 14,
                height: 14
            });
        }
    })
    </script>
</body>
<!-- END: Body-->

</html>