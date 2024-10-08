@extends('pages.main')
@section('layouts')

<section class="ftco-section bg-light">
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-lg-10 order-md-last">
                <div id="book-list" class="row">
                    <div class="col-md-12 mb-4">
                        <h3 style="color: #0e4582">{{$error}}</h3>
                    </div>
                    @foreach ($getBook as $data)
                    <div class="col-sm-12 col-md-12 col-lg-4 ftco-animate  book-item" data-title="{{ $data->tenSach }}">
                        <div class="product d-flex flex-column">
                            <a href="{{ route('pageDetailBook', $data->id_Sach) }}" class="img-prod">
                                <img class="img-fluid" src="{{ $data->duongDan }}" alt="Sách">
                                <div class="overlay"></div>
                            </a>
                            <div class="text py-3 pb-4 px-3">
                                <div class="d-flex">
                                    <div class="cat">
                                        <span>Vị trí: {{ $data->tenViTri }}</span>
                                    </div>
                                    <div class="rating">
                                        <p class="text-right mb-0">
                                            @php
                                            $averageRating = min($data->danhGiaTrungBinh, 5);
                                            @endphp

                                            @for ($i = 1; $i <= 5; $i++)
                                                @if ($i <=$averageRating)
                                                <a href="#" style="color:#f1b609">
                                                <span class="ion-ios-star"></span>
                                                </a>
                                                @else
                                                <a href="#" style="color:#f1b609">
                                                    <span class="ion-ios-star-outline"></span>
                                                </a>
                                                @endif
                                                @endfor
                                        </p>
                                    </div>
                                </div>
                                <h3 style="height: 66px;">
                                    <a style="text-align: left; display: block;" href="{{ route('pageDetailBook', $data->id_Sach) }}">{{ $data->tenSach }} ({{ $data->tenTacGia }} - {{ $data->tenNhaXuatBan }})</a>
                                </h3>
                                <div class="d-flex">
                                    <div class="pricing" style="width:50%">
                                        <p class="price text-success"><span>Số lượng: {{ $data->soLuongCoSan }}</span></p>
                                    </div>
                                    <div class="pricing" style="width:50%; text-align:right">
                                        <p class="price text-info"><span>Lượt mượn: {{ $data->luotMuon }}</span></p>
                                    </div>
                                </div>
                                <form id="cart-form-{{ $data->id_Sach }}" action="{{ route('addCart') }}" method="post">
                                    @csrf
                                    <input type="hidden" name="soLuong" value="1">
                                    <input type="hidden" name="id_Sach" value="{{ \Illuminate\Support\Facades\Crypt::encryptString($data->id_Sach) }}">
                                    <p class="bottom-area d-flex px-3">
                                        @if(isset($user))
                                        <a href="javascript:void(0)" class="add-to-cart text-center py-2 mr-1" onclick="document.getElementById('cart-form-{{ $data->id_Sach }}').submit();">
                                            <span>Thêm vào giỏ
                                                <i class="ion-ios-add ml-1"></i>
                                            </span>
                                        </a>
                                        @endif
                                        <a href="{{ route('pageDetailBook', $data->id_Sach) }}" class="buy-now text-center py-2">Chi tiết
                                            <span>
                                                <i class="far fa-eye ml-1"></i>
                                            </span>
                                        </a>
                                    </p>
                                </form>
                            </div>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
            <div class="col-md-4 col-lg-2">
                <div class="sidebar">
                    <div class="sidebar-box-2">
                        <h2 class="heading">Lọc theo: </h2>
                        <div class="fancy-collapse-panel">
                            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="headingOne">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Ngôn ngữ
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                                        <div class="panel-body">
                                            <ul>
                                                @foreach ($getAllLanguage as $data)
                                                <li><a href="?query={{ request()->get('query') }}&ngonngu={{ $data->id_NgonNgu }}">{{ $data->tenNgonNgu }}</a></li>
                                                @endforeach
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="headingTwo">
                                        <h4 class="panel-title">
                                            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">Nhà xuất bản
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                        <div class="panel-body">
                                            <ul>
                                                @foreach ($getAllPublishers as $data)
                                                <li><a href="?query={{ request()->get('query') }}&nxb={{ $data->id_NhaXuatBan }}">{{ $data->tenNhaXuatBan }}</a></li>
                                                @endforeach
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="headingThree">
                                        <h4 class="panel-title">
                                            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">Ngành học
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                                        <div class="panel-body">
                                            <ul>
                                                @foreach ($getAllDiscipline as $data)
                                                <li><a href="?query={{ request()->get('query') }}&nganhhoc={{ $data->id_NganhHoc }}">{{ $data->tenNganhHoc }}</a></li>
                                                @endforeach
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="theloai1">
                                        <h4 class="panel-title">
                                            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#theloai" aria-expanded="false" aria-controls="theloai">Thể loại
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="theloai" class="panel-collapse collapse" role="tabpanel" aria-labelledby="theloai1">
                                        <div class="panel-body">
                                            <ul>
                                                @foreach ($getCategories as $data)
                                                <li><a href="?query={{ request()->get('query') }}&theloai={{ $data->id_TheLoai }}">{{ $data->tenTheLoai }}</a></li>
                                                @endforeach
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="vitri1">
                                        <h4 class="panel-title">
                                            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#vitri" aria-expanded="false" aria-controls="vitri">Vị trí
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="vitri" class="panel-collapse collapse" role="tabpanel" aria-labelledby="vitri1">
                                        <div class="panel-body">
                                            <ul>
                                                @foreach ($getAllBookLocation as $data)
                                                <li><a href="?query={{ request()->get('query') }}&vitri={{ $data->id_ViTri }}">{{ $data->tenViTri }}</a></li>
                                                @endforeach
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="sidebar-box-2">
                        <h2 class="heading">Tìm kiếm</h2>
                        <div id="search-form" class="search-form">
                            <div class="form-group">
                                <input type="text" id="search-input" class="form-control" placeholder="Tìm kiếm...">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        @if( $recommendedBooks != [])
        <div class="row mt-5">
            <div class="col-md-12 col-lg-12 order-md-last">
                <div class="row">
                    <div class="col-md-12 mb-2">
                        <h3 style="color: #0e4582">CÓ THỂ BẠN THÍCH:</h3>
                    </div>
                    <div class="col-md-12 ftco-animate fadeInUp ftco-animated d-flex p-0">
                        <div class="book-container d-flex overflow-auto">
                            @foreach ($recommendedBooks as $data)
                            <div class="col-sm-6 col-md-6 col-lg-4 ftco-animate book-item book-recom">
                                <div class="product d-flex flex-column">
                                    <a href="{{ route('pageDetailBook', $data->id_Sach) }}" class="img-prod">
                                        <img class="img-fluid" src="{{ $data->duongDan }}" alt="Sách">
                                        <div class="overlay"></div>
                                    </a>
                                    <div class="text py-3 pb-4 px-3">
                                        <div class="d-flex">
                                            <div class="cat">
                                            </div>
                                            <div class="rating">
                                                <p class="text-right mb-0">
                                                    @php
                                                    $averageRating = min($data->danhGiaTrungBinh, 5);
                                                    @endphp
                                                    @for ($i = 1; $i <= 5; $i++)
                                                        @if ($i <=$averageRating)
                                                        <a href="#" style="color:#f1b609">
                                                        <span class="ion-ios-star"></span>
                                                        </a>
                                                        @else
                                                        <a href="#" style="color:#f1b609">
                                                            <span class="ion-ios-star-outline"></span>
                                                        </a>
                                                        @endif
                                                        @endfor
                                                </p>
                                            </div>
                                        </div>
                                        <h3 style="height: 66px;">
                                            <a style="text-align: left; display: block;" href="{{ route('pageDetailBook', $data->id_Sach) }}">{{ $data->tenSach }} ({{ $data->tenTacGia }})</a>
                                        </h3>
                                        <div class="d-flex">
                                            <div class="pricing" style="width:50%">
                                                <p class="price text-success"><span>Số lượng: {{ $data->soLuongCoSan }}</span></p>
                                            </div>
                                            <div class="pricing" style="width:50%; text-align:right">
                                                <p class="price text-info"><span>Lượt mượn: {{ $data->luotMuon }}</span></p>
                                            </div>
                                        </div>
                                        <form id="cart-form-{{ $data->id_Sach }}" action="{{ route('addCart') }}" method="post">
                                            @csrf
                                            <input type="hidden" name="soLuong" value="1">
                                            <input type="hidden" name="id_Sach" value="{{ \Illuminate\Support\Facades\Crypt::encryptString($data->id_Sach) }}">
                                            <p class="bottom-area d-flex px-3">
                                                @if(isset($user))
                                                <a href="javascript:void(0)" class="add-to-cart text-center py-2 mr-1" onclick="document.getElementById('cart-form-{{ $data->id_Sach }}').submit();">
                                                    <span>Thêm vào giỏ
                                                        <i class="ion-ios-add ml-1"></i>
                                                    </span>
                                                </a>
                                                @endif
                                                <a href="{{ route('pageDetailBook', $data->id_Sach) }}" class="buy-now text-center py-2">Chi tiết
                                                    <span>
                                                        <i class="far fa-eye ml-1"></i>
                                                    </span>
                                                </a>
                                            </p>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>
        @endif
    </div>
    </div>
</section>
<script src="{{asset('pages/js/searchBook.js')}}"></script>
@endsection