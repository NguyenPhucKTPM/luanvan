<!DOCTYPE html>
<html lang="en">

<head>
    <title>Minishop - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="shortcut icon" type="image/x-icon" href="pages/images/logo.png">

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">


    <link rel="stylesheet" href="{{asset ('pages/css/open-iconic-bootstrap.min.css')}}">
    <link rel="stylesheet" href="{{asset('pages/css/animate.css ')}}">

    <link rel="stylesheet" href="{{asset('pages/css/owl.carousel.min.css ')}}">
    <link rel="stylesheet" href="{{asset('pages/css/owl.theme.default.min.css ')}}">
    <link rel="stylesheet" href="{{asset('pages/css/magnific-popup.css')}}">

    <link rel="stylesheet" href="{{asset('pages/css/aos.css')}}">

    <link rel="stylesheet" href="{{asset('pages/css/ionicons.min.css')}}">

    <link rel="stylesheet" href="{{asset('pages/css/bootstrap-datepicker.css')}} ">
    <link rel="stylesheet" href="{{asset('pages/css/jquery.timepicker.css')}}">


    <link rel="stylesheet" href="{{asset('pages/css/flaticon.css')}} ">
    <link rel="stylesheet" href="{{asset('pages/css/icomoon.css')}} ">
    <link rel="stylesheet" href="{{asset('pages/css/style.css')}}">
    <link rel="stylesheet" href="{{asset('pages/css/swiper.css')}}">
    <link rel="stylesheet" href="{{asset('pages/css/search.css')}}">
    <link rel="stylesheet" href="{{asset('pages/css/infoUser.css')}}">


</head>

<body class="goto-here">


    @include('pages.header')

    @yield('content', View::make('pages.main'))

    @include('pages.footer')

    <!-- loader -->
    <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
            <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
            <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                stroke="#0e4582" />
        </svg></div>


    <script src="{{asset('pages/js/jquery.min.js')}}"></script>
    <script src="{{asset('pages/js/jquery-migrate-3.0.1.min.js')}}"></script>
    <script src="{{asset('pages/js/popper.min.js')}}"></script>
    <script src="{{asset('pages/js/bootstrap.min.js')}}"></script>
    <script src="{{asset('pages/js/jquery.easing.1.3.js')}}"></script>
    <script src="{{asset('pages/js/jquery.waypoints.min.js')}}"></script>
    <script src="{{asset('pages/js/jquery.stellar.min.js')}}"></script>
    <script src="{{asset('pages/js/owl.carousel.min.js')}}"></script>
    <script src="{{asset('pages/js/jquery.magnific-popup.min.js')}}"></script>
    <script src="{{asset('pages/js/aos.js')}}"></script>
    <script src="{{asset('pages/js/jquery.animateNumber.min.js')}}"></script>
    <script src="{{asset('pages/js/bootstrap-datepicker.js')}}"></script>
    <script src="{{asset('pages/js/scrollax.min.js')}}"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>

    <script src="{{asset('pages/js/google-map.js')}}"></script>
    <script src="{{asset('pages/js/main.js')}}"></script>

    <script src="{{asset('pages/js/clickSearch.js')}}"></script>


</body>

</html>