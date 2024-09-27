<!DOCTYPE html>
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
        <!--begin::Authentication - Sign-in -->
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
                    <div class="w-lg-500px p-10 p-lg-15 mx-auto">
                        <!--begin::Form-->
                        <form class="form w-100" action="{{route('login')}}" method="POST">
                            @csrf
                            <!--begin::Heading-->
                            <div class="text-center mb-10">
                                <!--begin::Title-->
                                <h1 class="text-dark mb-3">Đăng nhập</h1>
                                <!--end::Title-->
                                <!--begin::Link-->
                                <div class="text-gray-400 fw-bold fs-4">Chưa có tài khoản?
                                    <a href="{{route('dang-ky')}}" class="link-primary fw-bolder">Đăng ký ở đây</a>
                                </div>
                                <!--end::Link-->
                            </div>
                            <!--begin::Heading-->
                            <!--begin::Input group-->
                            <div class="fv-row mb-10">
                                <!--begin::Label-->
                                <label class="form-label fs-6 fw-bolder text-dark" for="email">Địa chỉ Email</label>
                                <!--end::Label-->
                                <!--begin::Input-->
                                <input class="form-control form-control-lg form-control-solid" type="text" id="email" placeholder="Nhập địa chỉ email" name="email" autocomplete="off" />
                                @if($errors->has('email'))
                                <span class="error-message text-danger">*
                                    {{$errors->first('email')}}</span>
                                @endif
                                <!--end::Input-->
                            </div>
                            <!--end::Input group-->
                            <!--begin::Input group-->
                            <div class="fv-row mb-10">
                                <!--begin::Wrapper-->
                                <div class="d-flex flex-stack mb-2">
                                    <!--begin::Label-->
                                    <label class="form-label fw-bolder text-dark fs-6 mb-0" for="password">Mật khẩu</label>
                                    <!--end::Label-->
                                    <!--begin::Link-->
                                    <a href="{{route('forgot')}}" class="link-primary fs-6 fw-bolder">Quên mật khẩu ?</a>
                                    <!--end::Link-->
                                </div>
    
                                <input class="form-control form-control-lg form-control-solid" name="password" placeholder="********" type="password" name="password" autocomplete="off" />
                                @if($errors->has('password'))
                                <span class="error-message text-danger">*
                                    {{$errors->first('password')}}</span>
                                @endif
                              
                                <!--end::Input-->
                            </div>
                            <!--end::Input group-->
                            <!--begin::Actions-->
                            <div class="text-center">
                                <!--begin::Submit button-->
                                <button type="submit" id="kt_sign_in_submit" class="btn btn-lg btn-primary w-100 mb-5">
                                    <span class="indicator-label">Đăng nhập</span>
                                    <span class="indicator-progress">Chờ...
                                        <span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
                                </button>
                                <!--end::Submit button-->
                                <!--begin::Separator-->

                                <!--end::Google link-->
                            </div>
                            <!--end::Actions-->
                        </form>
                        <!--end::Form-->
                    </div>
                    <!--end::Wrapper-->
                </div>
                <!--end::Content-->
                <!--begin::Footer-->
                <div class="d-flex flex-center flex-wrap fs-6 p-5 pb-0">
                    <!--begin::Links-->
                    <!--end::Links-->
                </div>
                <!--end::Footer-->
            </div>
            <!--end::Body-->
        </div>
        <!--end::Authentication - Sign-in-->
    </div>
    <!--end::Root-->
    <!--end::Main-->
    <!--begin::Javascript-->
    <script>
        var hostUrl = "assets/";
    </script>
    <!--begin::Global Javascript Bundle(used by all pages)-->
    <script src={{asset('assets/plugins/global/plugins.bundle.js')}}></script>
    <script src= {{asset('assets/js/scripts.bundle.js')}}></script>
    <!--end::Global Javascript Bundle-->
    <!--begin::Page Custom Javascript(used by this page)-->
    <script src={{asset('assets/js/custom/authentication/sign-in/general.js')}}></script>
    <script src={{asset('assets/js/custom/authentication/sign-up/general.js')}}></script>
    <!--end::Page Custom Javascript-->
    <!--end::Javascript-->
</body>
<!--end::Body-->

</html>