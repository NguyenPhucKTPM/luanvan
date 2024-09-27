<!DOCTYPE html>
<!--
Author: Keenthemes
Product Name: Metronic - Bootstrap 5 HTML, VueJS, React, Angular & Laravel Admin Dashboard Theme
Purchase: https://1.envato.market/EA4JP
Website: http://www.keenthemes.com
Contact: support@keenthemes.com
Follow: www.twitter.com/keenthemes
Dribbble: www.dribbble.com/keenthemes
Like: www.facebook.com/keenthemes
License: For each use you must have a valid license purchased only from above link in order to legally use the theme for your project.
-->
<html lang="en">
<!--begin::Head-->

<head>
    <base href="../../../">
    <title>{{$title}}</title>
    <meta charset="utf-8" />
    <link rel="shortcut icon" type="image/x-icon" href="{{asset('pages/images/logo.png')}}">
    <meta name="description" content="The most advanced Bootstrap Admin Theme on Themeforest trusted by 94,000 beginners and professionals. Multi-demo, Dark Mode, RTL support and complete React, Angular, Vue &amp; Laravel versions. Grab your copy now and get life-time updates for free." />
    <meta name="keywords" content="Metronic, bootstrap, bootstrap 5, Angular, VueJs, React, Laravel, admin themes, web design, figma, web development, free templates, free admin themes, bootstrap theme, bootstrap template, bootstrap dashboard, bootstrap dak mode, bootstrap button, bootstrap datepicker, bootstrap timepicker, fullcalendar, datatables, flaticon" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta property="og:locale" content="en_US" />
    <meta property="og:type" content="article" />
    <meta property="og:title" content="Metronic - Bootstrap 5 HTML, VueJS, React, Angular &amp; Laravel Admin Dashboard Theme" />
    <meta property="og:url" content="https://keenthemes.com/metronic" />
    <meta property="og:site_name" content="Keenthemes | Metronic" />
    <link rel="canonical" href="https://preview.keenthemes.com/metronic8" />
    <link rel="shortcut icon" href="assets/media/logos/favicon.ico" />
    <!--begin::Fonts-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />
    <!--end::Fonts-->
    <!--begin::Global Stylesheets Bundle(used by all pages)-->
    <link href="{{asset('assets/plugins/global/plugins.bundle.css')}}" rel="stylesheet" type="text/css" />
    <link href="{{asset('assets/css/style.bundle.css')}}" rel="stylesheet" type="text/css" />
    <!--end::Global Stylesheets Bundle-->
</head>
<!--end::Head-->
<!--begin::Body-->

<body id="kt_body" class="bg-body">
    <!--begin::Main-->
    <!--begin::Root-->
    <div class="d-flex flex-column flex-root">
        <!--begin::Authentication - Sign-up -->
        <div class="d-flex flex-column flex-lg-row flex-column-fluid">
            <!--begin::Aside-->
            <div class="d-flex flex-column flex-lg-row-auto w-xl-600px positon-xl-relative" style="background-color: #0095e8">
                <!--begin::Wrapper-->
                <div class="d-flex flex-column position-xl-fixed top-0 bottom-0 w-xl-600px scroll-y">
                    <!--begin::Content-->
                    <div class="d-flex flex-row-fluid flex-column text-center p-10 pt-lg-20">
                        <!--begin::Logo-->
                        <a href="{{route('home')}}" class="py-9 mb-5">
                            <img alt="Logo" src="{{asset('pages/images/logo_ctut1.png')}}" class="h-50px" />
                        </a>
                        <!--end::Logo-->
                        <!--begin::Title-->
                        <h1 class="fw-bolder fs-2qx pb-5 pb-md-10" style="color: #fff;">Chào mừng đến với thư viện CTUT</h1>
                        <!--end::Title-->
                        <!--begin::Description-->
                        <p class="fw-bold fs-2" style="color: #fff;">Hãy thư có phút giây thư giản
                            <br />với những cuốn sách hay
                        </p>
                        <!--end::Description-->
                    </div>
                    <!--end::Content-->
                    <!--begin::Illustration-->
                    <div class="d-flex flex-row-auto bgi-no-repeat bgi-position-x-center bgi-size-contain bgi-position-y-bottom min-h-100px min-h-lg-350px" style="background-image: url({{asset('assets/media/illustrations/sketchy-1/13.png')}}"></div>
                    <!--end::Illustration-->
                </div>
                <!--end::Wrapper-->
            </div>
            <!--end::Aside-->
            <!--begin::Body-->
            <div class="d-flex flex-column flex-lg-row-fluid py-10">
                <!--begin::Content-->
                <div class="d-flex flex-center flex-column flex-column-fluid">
                    <!--begin::Wrapper-->
                    <div class="w-lg-600px p-10 p-lg-15 mx-auto">
                        <!--begin::Form-->
                        <form class="form w-100" action="{{ route('register') }}" method="POST">
                            @csrf
                            <!--begin::Heading-->
                            <div class="mb-10 text-center">
                                <!--begin::Title-->
                                <h1 class="text-dark mb-3">Đăng ký tài khoản</h1>
                                <!--end::Title-->
                                <!--begin::Link-->
                                <div class="text-gray-400 fw-bold fs-4">Đã có tài khoản?
                                    <a href="{{route('dang-nhap')}}" class="link-primary fw-bolder">Đăng nhập ở đây</a>
                                </div>
                                <!--end::Link-->
                            </div>

                            <div class="fv-row mb-7">
                                <label class="form-label fw-bolder text-dark fs-6" for="email">Địa chỉ Email</label>
                                <input class="form-control form-control-lg form-control-solid" id="email" type="email" placeholder="example@gmail.com" name="email" />
                                @if($errors->has('email'))
                                <span class="error-message text-danger">*
                                    {{$errors->first('email')}}</span>
                                @endif
                            </div>

                            <div class="row fv-row mb-7">
                                <div class="col-xl-6">
                                    <label class="form-label fw-bolder text-dark fs-6" for="tenNguoiDung">Họ tên</label>
                                    <input class="form-control form-control-lg form-control-solid mb-7 mb-md-0" type="text" id="tenNguoiDung" name="tenNguoiDung"
                                        placeholder="Nhập họ và tên" />
                                    @if($errors->has('tenNguoiDung'))
                                    <span class="error-message text-danger">*
                                        {{$errors->first('tenNguoiDung')}}</span>
                                    @endif
                                </div>
                                <div class="col-xl-6">
                                    <label class="form-label fw-bolder text-dark fs-6">Ngày sinh</label>
                                    <input type="text" id="fp-default" name="ngaySinh"
                                        class="form-control flatpickr-basic flatpickr-input active form-control-solid"
                                        placeholder="YYYY-MM-DD" readonly="readonly">
                                    @if($errors->has('ngaySinh'))
                                    <span class="error-message text-danger">*
                                        {{$errors->first('ngaySinh')}}</span>
                                    @endif
                                </div>
                            </div>

                            <div class="row fv-row mb-7">
                                <div class="col-xl-6">
                                    <label class="form-label fw-bolder text-dark fs-6" for="SDT">Số điện thoại</label>
                                    <input class="form-control form-control-lg form-control-solid mb-7 mb-md-0" type="text" id="SDT" name="SDT"
                                        placeholder="Nhập số điện thoại" />
                                    @if($errors->has('SDT'))
                                    <span class="error-message text-danger">*
                                        {{$errors->first('SDT')}}</span>
                                    @endif
                                </div>
                                <div class="col-xl-6">
                                    <label for="id_VaiTro" class="form-label fw-bolder text-dark fs-6">Chọn vai trò</label>
                                    <select name="id_VaiTro" id="id_VaiTro" class="form-control form-control-lg form-control-solid">
                                        <option value="4">Sinh viên</option>
                                        <option value="3">Giảng viên</option>
                                    </select>
                                    @if($errors->has('id_VaiTro'))
                                    <span class="error-message text-danger">*
                                        {{$errors->first('id_VaiTro')}}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="row fv-row mb-7">
                                <div class="col-xl-12">
                                    <label class="form-label fw-bolder text-dark fs-6">Giới tính</label>
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
                            </div>

                            <div class="mb-10 fv-row" data-kt-password-meter="true">
                                <!--begin::Wrapper-->
                                <div class="mb-1">
                                    <!--begin::Label-->
                                    <label class="form-label fw-bolder text-dark fs-6" for="password">Mật khẩu</label>
                                    <!--end::Label-->
                                    <!--begin::Input wrapper-->
                                    <div class="position-relative mb-3">
                                        <input class="form-control form-control-lg form-control-solid" type="password" id="password" placeholder="" name="password" autocomplete="off" />
                                        <span class="btn btn-sm btn-icon position-absolute translate-middle top-50 end-0 me-n2" data-kt-password-meter-control="visibility">
                                            <i class="bi bi-eye-slash fs-2"></i>
                                            <i class="bi bi-eye fs-2 d-none"></i>
                                        </span>
                                    </div>
                                    <!--end::Input wrapper-->
                                    <!--begin::Meter-->
                                    <div class="d-flex align-items-center mb-3" data-kt-password-meter-control="highlight">
                                        <div class="flex-grow-1 bg-secondary bg-active-success rounded h-5px me-2"></div>
                                        <div class="flex-grow-1 bg-secondary bg-active-success rounded h-5px me-2"></div>
                                        <div class="flex-grow-1 bg-secondary bg-active-success rounded h-5px me-2"></div>
                                        <div class="flex-grow-1 bg-secondary bg-active-success rounded h-5px"></div>
                                    </div>
                                    <!--end::Meter-->
                                </div>
                                <!--end::Wrapper-->
                                <!--begin::Hint-->
                                <div class="text-muted">Mật khẩu có ít nhất 8 ký tự, phải có chữ in hoa và có số lẫn chữ</div>
                                @if($errors->has('password'))
                                <span class="error-message text-danger">*
                                    {{$errors->first('password')}}</span>
                                @endif
                                <!--end::Hint-->
                            </div>
                            <!--end::Input group=-->
                            <!--begin::Input group-->
                            <div class="fv-row mb-5">
                                <label class="form-label fw-bolder text-dark fs-6" for="rePassword">Xác nhận mật khẩu</label>
                                <input class="form-control form-control-lg form-control-solid" type="password" placeholder="" id="rePassword" name="rePassword" autocomplete="off" />
                                @if($errors->has('rePassword'))
                                <span class="error-message text-danger">*
                                    {{$errors->first('rePassword')}}</span>
                                @endif
                            </div>
                            <div class="fv-row mb-5">
                                <label class="d-block form-label fw-bolder text-dark fs-6" for="diaChi">Địa chỉ</label>
                                <textarea class="form-control form-control-solid" id="diaChi" name="diaChi" rows="3"
                                    style="height: 52px;"></textarea>
                                @if($errors->has('diaChi'))
                                <span class="error-message text-danger">*
                                    {{$errors->first('diaChi')}}</span>
                                @endif
                            </div>

                            <div class="text-center">
                                <button type="submit" id="kt_sign_up_submit" class="btn btn-lg btn-primary">
                                    <span class="indicator-label">Đăng ký</span>
                                    <span class="indicator-progress">Please wait...
                                        <span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
                                </button>
                            </div>
                            <!--end::Actions-->
                        </form>
                        <!--end::Form-->
                    </div>
                    <!--end::Wrapper-->
                </div>

            </div>
            <!--end::Body-->
        </div>
        <!--end::Authentication - Sign-up-->
    </div>
    <!--end::Root-->
    <!--end::Main-->
    <!--begin::Javascript-->
    <script>
        var hostUrl = "assets/";
    </script>
    <!--begin::Global Javascript Bundle(used by all pages)-->
    <script src={{asset('assets/plugins/global/plugins.bundle.js')}}></script>
    <script src={{asset('assets/js/scripts.bundle.js')}}></script>
    <script src={{asset('app-assets/js/core/app-menu.js')}}></script>
    <script src={{asset('app-assets/js/core/app.js')}}></script>

    <!-- END: Theme JS-->
    <script src={{asset('app-assets/vendors/js/pickers/pickadate/picker.js')}}></script>
    <script src={{asset('app-assets/vendors/js/pickers/pickadate/picker.date.js')}}></script>
    <script src={{asset('app-assets/vendors/js/pickers/pickadate/picker.time.js')}}></script>
    <script src={{asset('app-assets/vendors/js/pickers/pickadate/legacy.js')}}></script>
    <script src={{asset('app-assets/vendors/js/pickers/flatpickr/flatpickr.min.js')}}></script>
    <script src={{asset('app-assets/js/scripts/forms/pickers/form-pickers.js')}}></script>
    <script src={{asset('assets/js/custom/authentication/sign-up/general.js')}}></script>
    <!--end::Page Custom Javascript-->
    <!--end::Javascript-->
</body>
<!--end::Body-->

</html>