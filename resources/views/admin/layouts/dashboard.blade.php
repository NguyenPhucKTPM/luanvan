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
        <div class="col-lg-12 col-sm-12 col-12">
            <div class="card">
                <div class=" card-header d-flex flex-md-row flex-column justify-content-md-between justify-content-start  align-items-md-center align-items-start">
                    <h4 class="card-title">Thống kê phiếu mượn trong ngày và phân loại hình thức mượn</h4>
                    <div class="d-flex align-items-center mt-md-0 mt-1">
                        <i class="font-medium-2" data-feather="calendar"></i>  
                        <input type="text" class="form-control bg-transparent border-0 shadow-none" name="date-range" id="currentYearInput" placeholder="Lọc ngày">
                    </div>
                </div>
                <div class="card-body">
                    <div id="column-chart"></div>
                </div>
            </div>
        </div>
    </div>

    <div class="row match-height">     
            <div class="col-lg-6 col-sm-12 col-12">
            <div class="card">
                <div class="card-header flex-column align-items-start">
                    <h4 class="card-title mb-75">Thống kê hình thức mượn</h4>

                </div>
                <div class="card-body">
                    <div id="donut-chart"></div>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-sm-12 col-12">
                <div class="card">
                        <div class="
                                    card-header
                                    d-flex
                                    flex-sm-row flex-column
                                    justify-content-md-between
                                    align-items-start
                                    justify-content-start
                                ">
                            <h4 class="card-title mb-sm-0 mb-1">Tất cả phiếu mượn</h4>
                            </div>
                        <div class="card-body">
                            <div id="radialbar-chart"></div>
                         </div>
                </div>
            </div>
    </div>

    <div class="row match-height">
        <div class="col-lg-12 col-sm-12 col-12">
            <div class="card">
                    <div class=" card-header d-flex flex-md-row flex-column justify-content-md-between justify-content-start  align-items-md-center align-items-start">
                        <h4 class="card-title">Thống kê phiếu mượn trong ngày và phân loại hình thức mượn</h4>
                        <div class="d-flex align-items-center mt-md-0 mt-1">
                            <i class="font-medium-2" data-feather="calendar"></i>  
                            <input type="text" class="form-control bg-transparent border-0 shadow-none datepicker" name="date-borrow" id="dateBorrowInput" placeholder="Lọc ngày">
                            </div>
                    </div>
                 <div class="card-body">
                     <!-- <canvas id="lineChart" class="line-chart-ex chartjs" data-height="450"></canvas> -->
                     <canvas id="statisticsChart" style="height: 500px; width: 100%;"></canvas>

                </div>
            </div>
        </div>
    </div>

</section>
@endsection

@section('scripts')
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script src="{{ asset('app-assets/vendors/js/charts/apexcharts.min.js')}}"></script>
<script src="{{ asset('app-assets/js/scripts/cards/card-statistics.js')}}"></script>
<script src="{{ asset('app-assets/js/scripts/cards/card-analytics.js')}}"></script>
<script src="{{ asset('app-assets/js/scripts/charts/chart-apex.js')}}"></script>
<script src="{{ asset('app-assets/vendors/js/charts/chart.min.js')}}"></script>
<script src="{{ asset('app-assets/js/scripts/charts/chart-chartjs.js')}}"></script>

<script>
        flatpickr("#currentYearInput", {
            mode: "range",
            dateFormat: "Y-m-d",
            theme: "dark"
        });     
</script>
<script>
        flatpickr("#dateBorrowInput", {
            mode: "range",
            dateFormat: "Y-m-d",
            theme: "dark"
        });     
</script>

<script>
    //tong sach trong kho
    var percentBookLocation = {{ $percentBookLocation }};

    //phan loai nguoi dung
    var countAdmin = {{$countAdmin}}  
    var countLibrarian = {{$countLibrarian}}  
    var countLecturer = {{$countLecturer}}  
    var countStudent = {{$countStudent}}  
    var countBorrowAtSchool = {{$countBorrowAtSchool}}  
    var countBorrowFromDistance = {{$countBorrowFromDistance}}  

    var countBorrowReturned = {{$countBorrowReturned}} 
    var countBorrowing = {{$countBorrowing}} 
    var countBorrowApprove = {{$countBorrowApprove}} 
    var countBorrowPending = {{$countBorrowPending}} 
    var countBorrowCancel = {{$countBorrowCancel}} 
    
</script>

@php
    $borrowData = [
        'dates' => $borrowType['dates'],
        'borrowAtSchool' => $borrowType['borrowAtSchool'],
        'borrowFromDistance' => $borrowType['borrowFromDistance'],
    ];
@endphp
<script>
var borrowData = @json($borrowData);
</script>

<script>
     var columnChart; 
    function initializeColumnChart() {
        var columnChartEl = document.querySelector('#column-chart');
        var columnChartConfig = {
            chart: {
                height: 400,
                type: 'bar',
                stacked: true,
                parentHeightOffset: 0,
                toolbar: { show: false }
            },
            plotOptions: {
                bar: { columnWidth: '15%' }
            },
            dataLabels: { enabled: false },
            legend: {
                show: true,
                position: 'top',
                horizontalAlign: 'start'
            },
            colors: ['#0e4582', '#3394ff'], // Màu biểu đồ
            stroke: { show: true, colors: ['transparent'] },
            grid: { xaxis: { lines: { show: true } } },
            series: [
                { name: 'Mượn ở trường', data: borrowData.borrowAtSchool },
                { name: 'Mượn từ xa', data: borrowData.borrowFromDistance }
            ],
            xaxis: { categories: borrowData.dates },
            fill: { opacity: 1 },
            yaxis: { opposite: false } // Thay đổi theo nhu cầu của bạn
        };

        if (columnChartEl) {
            columnChart = new ApexCharts(columnChartEl, columnChartConfig);
            columnChart.render();
        }
    }
    $('#currentYearInput').on('change', function() {
        var dateRange = $(this).val(); // Nhận giá trị từ input
        updateBorrowData(dateRange); // Gọi hàm cập nhật dữ liệu
    });

    function updateBorrowData(dateRange) {

        $.ajax({
            url: '{{ route('getBorrowByType') }}',
            method: 'GET',
            data: { 'date-range': dateRange },
            success: function(response) {
                
                // Cập nhật borrowData với dữ liệu mới
                borrowData.dates = response.dates;
                borrowData.borrowAtSchool = response.borrowAtSchool;
                borrowData.borrowFromDistance = response.borrowFromDistance;


                // Cập nhật biểu đồ với dữ liệu mới
                updateColumnChart();
            },
            error: function(xhr, status, error) {
                console.error("Error fetching data:", error);
            }
        });
    }
    function updateColumnChart() {
        if (columnChart) {
            columnChart.updateSeries([
                { name: 'Mượn ở trường', data: borrowData.borrowAtSchool },
                { name: 'Mượn từ xa', data: borrowData.borrowFromDistance }
            ]);

            columnChart.updateOptions({
                xaxis: { categories: borrowData.dates }
            });
        }
    }
    $(document).ready(function() {
        initializeColumnChart();
    });
</script>

@php
    $borrowStatusData = [
        'dates' => $borrowStatus['dates'],
        'waitingApproval' => $borrowStatus['waitingApproval'],
        'approved' => $borrowStatus['approved'],
        'canceled' => $borrowStatus['canceled'],
        'borrowing' => $borrowStatus['borrowing'],
        'returned' => $borrowStatus['returned'],
    ];
@endphp

<script>
var borrowStatusData = @json($borrowStatusData);
</script>

<script>
document.addEventListener('DOMContentLoaded', function() {
    var ctx = document.getElementById('statisticsChart').getContext('2d');

    // Tạo biểu đồ ban đầu
    var chart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: borrowStatusData.dates, // Nhãn ngày từ dữ liệu
            datasets: [{
                label: 'Chờ duyệt',
                data: borrowStatusData.waitingApproval,
                borderColor: '#ff9f43',
                tension: 0.1,
                fill: false
            }, {
                label: 'Đã duyệt',
                data: borrowStatusData.approved,
                borderColor: '#28c76f',
                tension: 0.1,
                fill: false
            }, {
                label: 'Đang mượn',
                data: borrowStatusData.borrowing,
                borderColor: '#00cfe8',
                tension: 0.1,
                fill: false
            }, {
                label: 'Đã trả',
                data: borrowStatusData.returned,
                borderColor: '#0e4582',
                tension: 0.1,
                fill: false
            }, {
                label: 'Đã hủy',
                data: borrowStatusData.canceled,
                borderColor: '#4b4b4b',
                tension: 0.1,
                fill: false
            }]
        },
        options: {
            responsive: true,
            plugins: {
                title: {
                    display: true,
                    text: 'Statistics - Borrow Status'
                }
            },
            scales: {
                x: {
                    title: {
                        display: true,
                        text: 'Date'
                    }
                },
                y: {
                    title: {
                        display: true,
                        text: 'Count'
                    },
                    beginAtZero: true
                }
            }
        }
    });

    // Cập nhật dữ liệu khi thay đổi ngày từ input mới
    $('#dateBorrowInput').on('change', function() {
        var dateRange = $(this).val();
        updateBorrowData(dateRange);
    });

    function updateBorrowData(dateRange) {
        // Nếu không có giá trị, không gửi yêu cầu
        if (!dateRange) {
            return;
        }

        $.ajax({
            url: '{{ route('getBorrowByStatus') }}', // Đường dẫn đến route của bạn
            method: 'GET',
            data: { 'date-borrow': dateRange }, // Gửi dữ liệu
            success: function(response) {
                console.log("Response data:", response); // In ra dữ liệu nhận được
                borrowStatusData.dates = response.dates;
                borrowStatusData.waitingApproval = response.waitingApproval;
                borrowStatusData.approved = response.approved;
                borrowStatusData.canceled = response.canceled;
                borrowStatusData.borrowing = response.borrowing;
                borrowStatusData.returned = response.returned;

                // Cập nhật biểu đồ với dữ liệu mới
                updateChart();
            },
            error: function(xhr, status, error) {
                console.error("Error fetching data:", error); // In ra lỗi nếu có
            }
        });
    }

    function updateChart() {
        chart.data.labels = borrowStatusData.dates;
        chart.data.datasets[0].data = borrowStatusData.waitingApproval;
        chart.data.datasets[1].data = borrowStatusData.approved;
        chart.data.datasets[2].data = borrowStatusData.borrowing;
        chart.data.datasets[3].data = borrowStatusData.returned;
        chart.data.datasets[4].data = borrowStatusData.canceled;
        chart.update();
    }
});
</script>

@endsection