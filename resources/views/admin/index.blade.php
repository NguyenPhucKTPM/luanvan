<!DOCTYPE html>
<html class="loading bordered-layout" lang="en" data-layout="bordered-layout" data-textdirection="ltr">
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
    <title>{{ $title }}</title>
    <link rel="apple-touch-icon" href="{{ asset('pages/images/logo.png') }}">
    <link rel="shortcut icon" type="image/x-icon" href="{{ asset('pages/images/logo.png') }}">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;1,400;1,500;1,600"
        rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/css/core/menu/menu-types/vertical-menu.css') }}">
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/css/forms/spinner/jquery.bootstrap-touchspin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>


    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css2?family=Inconsolata&amp;family=Roboto+Slab&amp;family=Slabo+27px&amp;family=Sofia&amp;family=Ubuntu+Mono&amp;display=swap">
    <!-- BEGIN: Vendor CSS-->

    <script src="https://cdn.ckeditor.com/4.25.0-lts/standard/ckeditor.js"></script>


    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/vendors/css/vendors.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/vendors/css/charts/apexcharts.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/vendors/css/extensions/toastr.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/vendors/css/forms/select/select2.min.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css/pages/app-ecommerce-details.min.css')}}">

    <!-- <link rel="stylesheet" type="text/css" href="app-assets/vendors/css/file-uploaders/dropzone.min.css"> -->
    <!-- <link rel="stylesheet" type="text/css" href="app-assets/css/plugins/forms/form-file-uploader.min.css"> -->

    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/css/bootstrap.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/css/bootstrap-extended.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/css/colors.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/css/components.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/css/themes/dark-layout.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/css/themes/bordered-layout.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/css/themes/semi-dark-layout.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/css/custom.css') }}">

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/css/pages/dashboard-ecommerce.css') }}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css/pages/app-ecommerce.css')}}">

    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/css/plugins/charts/chart-apex.css') }}">
    <link rel="stylesheet" type="text/css"
        href="{{ asset('app-assets/css/plugins/extensions/ext-component-toastr.css') }}">
    <link rel="stylesheet" type="text/css" href=" {{asset('app-assets/css/pages/app-user.css')}}">

    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <!-- <link rel="stylesheet" type="text/css" href="{{asset('assets/css/style.css')}}"> -->
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">

    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css/core/menu/menu-types/vertical-menu.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css/plugins/forms/pickers/form-flat-pickr.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css/plugins/forms/pickers/form-pickadate.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/vendors/css/pickers/pickadate/pickadate.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/vendors/css/pickers/flatpickr/flatpickr.min.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css/plugins/forms/form-validation.css')}}">
    <!-- END: Custom CSS-->

    <!-- table -->
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/vendors/css/tables/datatable/dataTables.bootstrap5.min.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/vendors/css/tables/datatable/buttons.bootstrap5.min.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('vendors/css/pickers/flatpickr/flatpickr.min.css')}}">
    <link rel="stylesheet" href="{{asset('app-assets/vendors/css/tables/datatable/rowGroup.bootstrap4.min.css') }}">
    <!-- table -->

</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body class="vertical-layout vertical-menu-modern  navbar-floating footer-static" data-open="click"
    data-menu="vertical-menu-modern" data-col="">

    <!-- BEGIN: Header-->
    @include('admin.header')
    <!-- END: Header-->

    <!-- BEGIN: Main Menu-->
    @include('admin.mainMenu')
    <!-- END: Main Menu-->

    <!-- BEGIN: Content-->
    @yield('content', View::make('admin.layouts.dashboard'))
    <!-- END: Content-->

    <!-- BEGIN: Footer-->
    @include('admin.footer')
    <!-- END: Footer-->

    <!-- BEGIN: Vendor JS-->
    <script src="{{ asset('app-assets/vendors/js/vendors.min.js') }}"></script>

    <!-- END: Vendor JS-->
    <!-- BEGIN: Page Vendor JS-->
    <script src="{{ asset('app-assets/vendors/js/forms/repeater/jquery.repeater.min.js') }}"></script>
    <script src="{{ asset('app-assets/vendors/js/charts/apexcharts.min.js') }}"></script>
    <script src="{{ asset('app-assets/vendors/js/forms/wizard/bs-stepper.min.js')}}"></script>
    <script src="{{ asset('app-assets/vendors/js/forms/spinner/jquery.bootstrap-touchspin.js')}}"></script>
    <script src="{{ asset('app-assets/vendors/js/forms/select/select2.full.min.js')}}"></script>
    <!-- <script src="app-assets/vendors/js/file-uploaders/dropzone.min.js"></script> -->


    <!-- BEGIN: Theme JS-->
    <script src="{{ asset('app-assets/js/core/app-menu.js')}}"></script>
    <script src="{{ asset('app-assets/js/core/app.js') }}"></script>
    <script src="{{ asset('app-assets/js/scripts/customizer.min.js')}}"></script>
    <!-- END: Theme JS-->
    <script src="{{ asset('app-assets/js/scripts/forms/form-select2.js')}}"></script>
    <script src="{{ asset('app-assets/js/scripts/forms/form-repeater.min.js')}}"></script>


    <script src=" {{ asset('app-assets/vendors/js/pickers/flatpickr/flatpickr.min.js')}}"></script>
    <script src=" {{ asset('app-assets/vendors/js/forms/validation/jquery.validate.min.js')}}"></script>
    <script src=" {{ asset('app-assets/vendors/js/pickers/pickadate/picker.js')}}"></script>
    <script src=" {{ asset('app-assets/vendors/js/pickers/pickadate/picker.date.js')}}"></script>
    <script src=" {{ asset('app-assets/vendors/js/pickers/pickadate/picker.time.js')}}"></script>
    <script src=" {{ asset('app-assets/vendors/js/pickers/pickadate/legacy.js')}}"></script>
    <script src=" {{ asset('app-assets/vendors/js/pickers/flatpickr/flatpickr.min.js')}}"></script>
    <script src=" {{ asset('app-assets/js/scripts/forms/pickers/form-pickers.js')}}"></script>
    <!-- <script src=" {{ asset('app-assets/js/scripts/pages/app-ecommerce-details.min.js')}}"></script> -->
    <!-- <script src="app-assets/js/scripts/forms/form-tooltip-valid.js"></script> -->
    <script src=" {{ asset('app-assets/js/scripts/pages/page-auth-register.js')}}"></script>
    <script src=" {{ asset('app-assets/js/scripts/forms/form-number-input.js')}}"></script>
    <script src=" {{ asset('app-assets/js/scripts/pages/app-ecommerce-checkout.js')}}"></script>
    <!-- <script src="app-assets/js/scripts/forms/form-file-uploader.min.js"></script> -->

    <!-- BEGIN: Page JS-->

    <!-- <table> -->
    <script src="{{ asset('app-assets/vendors/js/tables/datatable/customText.js') }}"></script>
    <script src="{{ asset('app-assets/vendors/js/tables/datatable/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('app-assets/vendors/js/tables/datatable/dataTables.bootstrap5.min.js') }}"></script>
    <script src="{{ asset('app-assets/vendors/js/tables/datatable/dataTables.responsive.min.js') }}"></script>
    <script src="{{ asset('app-assets/vendors/js/tables/datatable/responsive.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('app-assets/vendors/js/tables/datatable/datatables.buttons.min.js') }}"></script>
    <script src="{{ asset('app-assets/vendors/js/tables/datatable/jszip.min.js') }}"></script>
    <script src="{{ asset('app-assets/vendors/js/tables/datatable/pdfmake.min.js') }}"></script>
    <script src="{{ asset('app-assets/vendors/js/tables/datatable/vfs_fonts.js') }}"></script>
    <script src="{{ asset('app-assets/vendors/js/tables/datatable/buttons.html5.min.js') }}"></script>
    <script src="{{ asset('app-assets/vendors/js/tables/datatable/buttons.print.min.js') }}"></script>
    <script src="{{ asset('app-assets/vendors/js/tables/datatable/dataTables.rowGroup.min.js') }}"></script>
    <script src="{{ asset('app-assets/vendors/js/pickers/flatpickr/flatpickr.min.js') }}"></script>
    <!-- </table> -->

    <!-- @yield('page-vendor')
    @yield('page-script') -->

    <script>
        $(document).ready(function() {
            $('#table').DataTable();
        });
    </script>

    <script>
        $(window).on('load', function() {
            if (feather) {
                feather.replace({
                    width: 14,
                    height: 14
                });
            }
        });
    </script>
</body>
<!-- END: Body-->


</html>