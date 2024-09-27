@extends('admin.main')
@section('layouts')
<section id="statistics-card">

    <div class="row match-height">
        <div class="col-lg-4 col-sm-4 col-12">
            <div class="card">
                <div class="card-header flex-column align-items-start pb-0">
                    <div class="avatar bg-light-primary p-50 m-0" style="background: rgb(6 126 255 / 12%);">
                        <div class="avatar-content">
                            <i data-feather="users" class="font-medium-5"></i>
                        </div>
                    </div>
                    <h2 class="fw-bolder mt-1">{{ $countUser }}</h2>
                    <p class="card-text">Số lượng người dùng trong hệ thống</p>
                </div>
                <div id="line-area-chart-1"></div>
            </div>
        </div>

        <div class="col-lg-4 col-sm-4 col-12">
            <div class="card">
                <div class="card-header flex-column align-items-start pb-0">
                    <div class="avatar bg-light-success p-50 m-0">
                        <div class="avatar-content">
                            <i data-feather="package" class="font-medium-5"></i>
                        </div>
                    </div>
                    <h2 class="fw-bolder mt-1">{{$countBookLocation}}</h2>
                    <p class="card-text">Tổng vị trí trong ngăn</p>
                </div>
                <div id="line-area-chart-4"></div>
            </div>
        </div>

        <div class="col-lg-4 col-sm-4 col-12">
            <div class="card">
                <div class="card-header flex-column align-items-start pb-0">
                    <div class="avatar p-50 m-0" style="background: rgb(255 226 6 / 25%)">
                        <div class="avatar-content" style="color:#ebd918;">
                            <i data-feather="codepen" class="font-medium-5"></i>
                        </div>
                    </div>
                    <h2 class="fw-bolder mt-1">{{$countBookCase}}</h2>
                    <p class="card-text">Tổng số ngăn sách</p>
                </div>
                <div id="line-area-chart-3"></div>
            </div>
        </div>
    </div>

    <div class="row match-height">
        <div class="col-xl-2 col-md-4 col-sm-6">
            <div class="card text-center">
                <div class="card-body">
                    <div class="avatar p-50 mb-1" style="background: rgb(6 126 255 / 12%);">
                        <div class="avatar-content" style="color:#0e4582;">
                            <i data-feather="book-open" class="font-medium-5"></i>
                        </div>
                    </div>
                    <h2 class="fw-bolder">{{$countBook}}</h2>
                    <p class="card-text">Tổng các loại sách</p>
                </div>
            </div>
        </div>
        <div class="col-xl-2 col-md-4 col-sm-6">
            <div class="card text-center">
                <div class="card-body">
                    <div class="avatar bg-light-info p-50 mb-1">
                        <div class="avatar-content">
                            <i data-feather="eye" class="font-medium-5"></i>
                        </div>
                    </div>
                    <h2 class="fw-bolder">{{$sumViewBook}}</h2>
                    <p class="card-text">Lượt xem</p>
                </div>
            </div>
        </div>

        <div class="col-xl-2 col-md-4 col-sm-6">
            <div class="card text-center">
                <div class="card-body">
                    <div class="avatar bg-light-success p-50 mb-1">
                        <div class="avatar-content">
                            <i data-feather="play-circle" class="font-medium-5"></i>
                        </div>
                    </div>
                    <h2 class="fw-bolder">{{$sumReadBook}}</h2>
                    <p class="card-text">Lượt đọc</p>
                </div>
            </div>
        </div>

        <div class="col-xl-2 col-md-4 col-sm-6">
            <div class="card text-center">
                <div class="card-body">
                    <div class="avatar p-50 mb-1" style="background: rgb(14 255 157 / 22%);">
                        <div class="avatar-content" style="color:#33FFCC;">
                            <i data-feather="file-plus" class="font-medium-5"></i>
                        </div>
                    </div>
                    <h2 class="fw-bolder">{{$sumBorrowBook}}</h2>
                    <p class="card-text">Lượt mượn</p>
                </div>
            </div>
        </div>

        <div class="col-xl-2 col-md-4 col-sm-6">
            <div class="card text-center">
                <div class="card-body">
                    <div class="avatar p-50 mb-1" style="background: rgb(255 226 6 / 25%)">
                        <div class="avatar-content" style="color:#ebd918;">
                            <i data-feather="star" class="font-medium-5"></i>
                        </div>
                    </div>
                    <h2 class="fw-bolder">{{ number_format($averageStar, 1) }}</h2>
                    <p class="card-text">Đánh giá trung bình</p>
                </div>
            </div>
        </div>

        <div class="col-xl-2 col-md-4 col-sm-6">
            <div class="card text-center">
                <div class="card-body">
                    <div class="avatar  p-50 mb-1" style="background: rgb(255 201 6 / 32%)">
                        <div class="avatar-content" style="color:#ffc903;">
                            <i data-feather="message-square" class="font-medium-5"></i>
                        </div>
                    </div>
                    <h2 class="fw-bolder">{{$countComment}}</h2>
                    <p class="card-text">Lượt bình luận</p>
                </div>
            </div>
        </div>

    </div>

    <div class="row match-height">
        <div class="col-lg-8 col-sm-12 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between pb-0">
                    <h4 class="card-title">Tổng sách trong kho</h4>

                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-12 col-sm-12 col-12 d-flex justify-content-center">
                            <div id="support-tracker-chart"></div>
                        </div>
                    </div>
                    <div class="d-flex justify-content-between mt-5">
                        <div class="text-center">
                            <p class="card-text mb-50">Tổng số lượng sách</p>
                            <span class="font-large-1 fw-bold">{{ number_format($sumQuantityBook, 0, ',', '.') }}</span>
                        </div>
                        <div class="text-center">
                            <p class="card-text mb-50">Tổng vị trí chứa sách</p>
                            <span class="font-large-1 fw-bold">{{ number_format($sumQuantityBookLocation, 0, ',', '.') }}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-4 col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Phân loại người dùng</h4>
                    <div class="dropdown">
                        <i data-feather="more-vertical" class="cursor-pointer" role="button" id="heat-chart-dd" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        </i>
                    </div>
                </div>
                <div class="card-body">
                    <canvas class="polar-area-chart-ex chartjs" data-height="350"></canvas>
                </div>
            </div>
        </div>
    </div>

    <div class="row match-height">
       
        <div class="col-lg-8 col-sm-12 col-12">
        <form action="{{route('test')}}" method="post">
        @csrf
            <div class="card">
                <div class=" card-header d-flex flex-md-row flex-column justify-content-md-between justify-content-start  align-items-md-center align-items-start">
                    <h4 class="card-title">Thống kê phiếu mượn trong ngày và phân loại hình thức mượn</h4>
                    <div class="d-flex align-items-center mt-md-0 mt-1">
                        <i class="font-medium-2" data-feather="calendar"></i>
                        <input type="text" name="date-column" id="currentYearInput" class="form-control flat-picker bg-transparent border-0 shadow-none" placeholder="DD-MM-YYYY" />
                    </div>
                </div>
                <div class="card-body">
                    <div id="column-chart"></div>
                </div>
            </div>
        </div>
        
        <div class="col-lg-4 col-sm-12 col-12">
            <div class="card">
                <div class="card-header flex-column align-items-start">
                    <h4 class="card-title mb-75">Thống kê hình thức mượn</h4>

                </div>
                <div class="card-body">
                    <div id="donut-chart"></div>
                </div>
            </div>
        </div>



    </div>

    <div class="row match-height">
        <div class="col-lg-8 col-sm-12 col-12">
            <div class="card">
                <div class="
                                card-header
                                d-flex
                                flex-sm-row flex-column
                                justify-content-md-between
                                align-items-start
                                justify-content-start
                            ">
                    <div>
                        <h4 class="card-title">Thống kê số phiếu mượn và phân loại trạng thái</h4>
                        <span class="card-subtitle text-muted">Commercial networks</span>
                    </div>
                    <div class="d-flex align-items-center">
                        <i class="font-medium-2" data-feather="calendar"></i>
                        <input type="text" class="form-control flat-picker bg-transparent border-0 shadow-none" placeholder="YYYY-MM-DD" />
                    </div>
                </div>
                <div class="card-body">
                    <div id="line-area-chart"></div>
                </div>
            </div>
        </div>

        <div class="col-lg-4 col-sm-12 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between">
                    <h4 class="card-title">Tất cả phiếu mượn</h4>
                </div>
                <div class="card-body">
                    <div id="product-order-chart"></div>
                    <div class="d-flex mb-1">
                        <div class="d-flex align-items-center">
                            <i data-feather="circle" class="font-medium-1 text-warning"></i>
                            <span class="fw-bold ms-75">Đang chờ duyệt</span>
                        </div>
                        <span>23043</span>
                    </div>
                    <!-- <div class="d-flex justify-content-between mb-1">
                                    <div class="d-flex align-items-center">
                                        <i data-feather="circle" class="font-medium-1 text-warning"></i>
                                        <span class="fw-bold ms-75">Pending</span>
                                    </div>
                                    <span>14658</span>
                                </div> -->
                    <div class="d-flex justify-content-between mb-1">
                        <div class="d-flex align-items-center">
                            <i data-feather="circle" class="font-medium-1 text-danger"></i>
                            <span class="fw-bold ms-75">Rejected</span>
                        </div>
                        <span>4758</span>
                    </div>
                    <div class="d-flex justify-content-between mb-1">
                        <div class="d-flex align-items-center">
                            <i data-feather="circle" class="font-medium-1 text-danger"></i>
                            <span class="fw-bold ms-75">Rejected</span>
                        </div>
                        <span>4758</span>
                    </div>
                </div>
            </div>
        </div>

    </div>

</section>
@endsection

@section('scripts')
<script>
    //tong sach trong kho
    var percentBookLocation = {{ $percentBookLocation }};

    //phan loai nguoi dung
    var countAdmin = {{$countAdmin}}  
    var countLibrarian = {{$countLibrarian}}  
    var countLecturer = {{$countLecturer}}  
    var countStudent = {{$countStudent}}  


</script>



<script src="{{ asset('app-assets/vendors/js/charts/apexcharts.min.js')}}"></script>
<script src="{{ asset('app-assets/js/scripts/cards/card-statistics.js')}}"></script>
<script src="{{ asset('app-assets/js/scripts/cards/card-analytics.js')}}"></script>
<script src="{{ asset('app-assets/js/scripts/charts/chart-apex.js')}}"></script>
<script src="{{ asset('app-assets/vendors/js/charts/chart.min.js')}}"></script>
<script src="{{ asset('app-assets/js/scripts/charts/chart-chartjs.js')}}"></script>
@endsection