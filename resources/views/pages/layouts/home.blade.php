@extends('pages.main')
@section('layouts')
<!-- slide hinh anh -->
<swiper-container class="mySwiper" pagination="true" pagination-clickable="true" navigation="true" space-between="30"
    centered-slides="true" autoplay-delay="2500" autoplay-disable-on-interaction="false" loop="true">
    <swiper-slide>
        <img src="{{asset('pages/images/slide5.jpg')}}" alt="">
    </swiper-slide>
    <swiper-slide>
        <img src="{{asset('pages/images/slide6.jpg')}}" alt="">
    </swiper-slide>
    <swiper-slide>
        <img src="{{asset('pages/images/slide7.jpg')}}" alt="">
    </swiper-slide>
    <swiper-slide>
        <img src="{{asset('pages/images/slide8.jpg')}}" alt="">
    </swiper-slide>
    <swiper-slide>
        <img src="{{asset('pages/images/slide9.jpg')}}" alt="">
    </swiper-slide>
    <swiper-slide>
        <img src="{{asset('pages/images/slide10.jpg')}}" alt="">
    </swiper-slide>
    <swiper-slide>
        <img src="{{asset('pages/images/slide11.jpg')}}" alt="">
    </swiper-slide>
</swiper-container>

<!-- mo ta ngan gon -->
<section class="ftco-section ftco-no-pt ftco-no-pb">
    <div class="container">
        <div class="row no-gutters ftco-services">
            <div class="col-lg-4 text-center d-flex align-self-stretch ftco-animate">
                <div class="media block-6 services p-4 py-md-5">
                    <div class="icon d-flex justify-content-center align-items-center mb-4">
                        <i class="fas fa-gifts" style="font-size: 70px;"></i>
                    </div>
                    <div class="media-body">
                        <h3 class="heading">Miễn phí hoàn toàn</h3>
                        <p>Trải nghiệm mượn sách dễ dàng và miễn phí. Chỉ với vài thao tác đơn giản, bạn đã có thể tiếp cận những cuốn sách yêu thích mà không tốn chi phí.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 text-center d-flex align-self-stretch ftco-animate">
                <div class="media block-6 services p-4 py-md-5">
                    <div class="icon d-flex justify-content-center align-items-center mb-4">
                        <i class="fas fa-brain" style="font-size: 70px;"></i>
                    </div>
                    <div class="media-body">
                        <h3 class="heading">Gợi ý thông minh</h3>
                        <p>Hệ thống đề xuất sách phổ biến và phù hợp với sở thích cũng như lịch sử mượn của bạn, giúp trải nghiệm đọc trở nên thú vị hơn.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 text-center d-flex align-self-stretch ftco-animate">
                <div class="media block-6 services p-4 py-md-5">
                    <div class="icon d-flex justify-content-center align-items-center mb-4">
                        <i class="fab fa-bootstrap" style="font-size: 70px;"></i>
                    </div>
                    <div class="media-body">
                        <h3 class="heading">Giao diện thân thiện</h3>
                        <p>Giao diện được thiết kế trực quan, dễ sử dụng, giúp người dùng dễ dàng tìm kiếm và mượn sách chỉ trong vài cú nhấp chuột.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- /sach hot -->
@if($getHotBook != null)
<section class="ftco-section ftco-deal " style="background: #009ef7;">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <a href="{{ route('pageDetailBook', $getHotBook->id_Sach) }}">
                <img src="{{$getHotBook->duongDan}}" class="img-fluid" alt="">
                </a>
            </div>
            <div class="col-md-6">
                <div class="heading-section heading-section-white">
                    <span class="subheading">Lượt mượn cao nhất trong tháng</span>
                    <h2 class="mb-3">Lượt mượn cao nhất trong tháng</h2>
                </div>
                <div id="timer" class="d-flex mb-4">
                    <div class="time pl-4" id="days"></div>
                    <div class="time pl-4" id="hours"></div>
                    <div class="time pl-4" id="minutes"></div>
                    <div class="time pl-4" id="seconds"></div>
                </div>
                <div class="text-deal">
                    <h2><a href="{{ route('pageDetailBook', $getHotBook->id_Sach) }}">{{$getHotBook->tenSach}}</a></h2>
                    <p class="price"><span class="mr-2 text-dark">Lượt mượn</span><span class="price-sale">{{$getHotBook->luotMuon}}</span>
                    </p>
                </div>
                <div class="text-deal">
                    <p class="price"><span class="mr-2 text-dark">Số lượng đang còn</span><span class="price-sale">{{$getHotBook->soLuongCoSan}}</span>
                    </p>
                </div>
            </div>
        </div>
    </div>
</section>
@endif

<!-- sach moi nhat -->
<section class="ftco-section bg-light">
    <div class="container">
        <div class="row justify-content-center mb-3 pb-3">
            <div class="col-md-12 heading-section text-center ftco-animate">
                <h2 class="mb-4">Sách mới thêm vào </h2>
                <p>Luôn luôn cập nhật vào thư viện những cuốn sách mới nhất</p>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            @foreach ($getNewBook as $data )
            <div class="col-sm-12 col-md-6 col-lg-3 ftco-animate d-flex">
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
</section>

<!-- goi y sach phu hop -->
 @if(isset($user))
<section class="ftco-section bg-light">
    <div class="container">
        <div class="row justify-content-center mb-3 pb-3">
            <div class="col-md-12 heading-section text-center ftco-animate">
                <h2 class="mb-4">Có thể bạn sẽ thích</h2>
                <p>Những có cuốn sách luôn luôn phù hợp với sở thích của bạn</p>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            @foreach ($getRecommended as $data )
            <div class="col-sm-12 col-md-6 col-lg-3 ftco-animate d-flex">
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
</section>
@endif

<!-- hinh ảnh -->
<section class="ftco-gallery">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 heading-section text-center mb-4 ftco-animate">
                <h2 class="mb-4">Hình ảnh về sách</h2>
                <p>Hãy cùng khám phá thế giới sách và tri thức với chúng tôi. Từ những góc đọc sách ấm cúng đến các thư viện hoành tráng, chúng tôi ghi lại tinh hoa của việc khám phá văn học. Mỗi bức ảnh kể một câu chuyện</p>
            </div>
        </div>
    </div>
    <div class="container-fluid px-0">
        <div class="row no-gutters">
            <div class="col-md-4 col-lg-2 ftco-animate">
                <a href="{{asset('pages/images/g1.jpg')}}" class="gallery image-popup img d-flex align-items-center"
                    style="background-image: url({{asset('pages/images/g1.jpg')}});">
                    <div class="icon mb-4 d-flex align-items-center justify-content-center">
                        <span class="icon-instagram"></span>
                    </div>
                </a>
            </div>
            <div class="col-md-4 col-lg-2 ftco-animate">
                <a href="{{asset('pages/images/g2.jpg')}}" class="gallery image-popup img d-flex align-items-center"
                    style="background-image: url({{asset('pages/images/g2.jpg')}});">
                    <div class="icon mb-4 d-flex align-items-center justify-content-center">
                        <span class="icon-instagram"></span>
                    </div>
                </a>
            </div>
            <div class="col-md-4 col-lg-2 ftco-animate">
                <a href="{{asset('pages/images/g3.jpg')}}" class="gallery image-popup img d-flex align-items-center"
                    style="background-image: url({{asset('pages/images/g3.jpg')}});">
                    <div class="icon mb-4 d-flex align-items-center justify-content-center">
                        <span class="icon-instagram"></span>
                    </div>
                </a>
            </div>
            <div class="col-md-4 col-lg-2 ftco-animate">
                <a href="{{asset('pages/images/g4.jpg')}}" class="gallery image-popup img d-flex align-items-center"
                    style="background-image: url({{asset('pages/images/g4.jpg')}});">
                    <div class="icon mb-4 d-flex align-items-center justify-content-center">
                        <span class="icon-instagram"></span>
                    </div>
                </a>
            </div>
            <div class="col-md-4 col-lg-2 ftco-animate">
                <a href="{{asset('pages/images/g5.jpg')}}" class="gallery image-popup img d-flex align-items-center"
                    style="background-image: url({{asset('pages/images/g5.jpg')}});">
                    <div class="icon mb-4 d-flex align-items-center justify-content-center">
                        <span class="icon-instagram"></span>
                    </div>
                </a>
            </div>
            <div class="col-md-4 col-lg-2 ftco-animate">
                <a href="{{asset('pages/images/g6.jpg')}}" class="gallery image-popup img d-flex align-items-center"
                    style="background-image: url({{asset('pages/images/g6.jpg')}});">
                    <div class="icon mb-4 d-flex align-items-center justify-content-center">
                        <span class="icon-instagram"></span>
                    </div>
                </a>
            </div>
        </div>
    </div>
</section>
@endsection