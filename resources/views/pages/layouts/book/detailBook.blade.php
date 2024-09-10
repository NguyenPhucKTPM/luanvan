@extends('pages.main')
@section('layouts')
<section class="ftco-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 mb-5 ftco-animate">
                <a href="{{$detailBook->duongDan}}" class="image-popup prod-img-bg"><img src="{{$detailBook->duongDan}}" class="img-fluid" alt="Sách thư viện"></a>
            </div>
            <div class="col-lg-6 product-details pl-md-5 ftco-animate">
                <h3>{{$detailBook->tenSach}}</h3>
                <div class="rating d-flex">
                    <p class="text-left mr-4">
                        <a href="#" class="mr-2" style="color:#f1b609">5.0</a>
                        <a href="#" style="color:#f1b609"><span class="ion-ios-star-outline"></span></a>
                        <a href="#" style="color:#f1b609"><span class="ion-ios-star-outline"></span></a>
                        <a href="#" style="color:#f1b609"><span class="ion-ios-star-outline"></span></a>
                        <a href="#" style="color:#f1b609"><span class="ion-ios-star-outline"></span></a>
                        <a href="#" style="color:#f1b609"><span class="ion-ios-star-outline"></span></a>
                    </p>
                    <p class="text-left mr-4">
                        <a href="#" class="mr-2" style="color: #000;">Sẵn có <span style="color: #bbb;">{{$detailBook->soLuongCoSan}}</span></a>
                    </p>
                    <p class="text-left">
                        <a href="#" class="mr-2" style="color: #000;">Vị trí <span style="color: #bbb;">{{$detailBook->tenViTri}}</span></a>
                    </p>
                </div>
                <p class="price"><span>Giá nhập: {{number_format($detailBook->giaTien, 0, ',', '.')}}₫</span></p>
                <div class="row mt-2">
                    <form id="cart-form" action="{{route('addCart')}}" method="post">
                        @csrf
                        <div class="col-md-12">
                            <p class="info-detail-book">Mã sách:<span> {{$detailBook->maSach}}</span></p>
                            <p class="info-detail-book">Tác giả:<span> {{$detailBook->tenTacGia}}</span></p>
                            <p class="info-detail-book">Nhà xuất bản:<span> {{$detailBook->tenNhaXuatBan}} - {{$detailBook->namXuatBan}}</span></p>
                            <p class="info-detail-book">Ngôn ngữ:<span> {{$detailBook->tenNgonNgu}}</span></p>
                            <p class="info-detail-book">Số trang:<span> {{$detailBook->soTrang}}</span></p>
                            <p class="info-detail-book">Thể loại:
                                @foreach ($categories as $data )
                                <a href="{{ route('listBookByCategory', ['category' => $data->id_TheLoai]) }}">
                                    <span class="badge rounded-pill  bg-info mr-1 text-light" style="font-size:85%;padding:0.35em 1.2em;">{{$data->tenTheLoai}}</span>
                                </a>
                                @endforeach
                            </p>
                            <p class="info-detail-book">Ngành học:
                                @foreach ($disciplines as $data )
                                <!-- <p class="information-book"></p> -->
                                <span class="badge rounded-pill badge-glow bg-success mr-1 text-light" style="font-size:85%;padding:0.35em 1.2em;">{{$data->tenNganhHoc}}</span>
                                @endforeach
                            </p>
                            <p class="info-detail-book">Đường dẫn:
                                <a href="{{$detailBook->fileSach == 'null' ? '#' : $detailBook->fileSach }}" target="{{ $detailBook->fileSach == 'null' ? '_self' : '_blank' }}">
                                    <span>{{$detailBook->fileSach == null ? 'Không có' : 'Đọc sách online ở đây'}}</span>
                                </a>
                            </p>
                        </div>
                        <div class="w-100"></div>
                        <div class="col-md-12 d-flex">
                            <p class="mr-4" style="color: #000;">Lượt xem: {{$detailBook->luotXem}}</p>
                            <p class="mr-4" style="color: #000;">Lượt đọc: {{$detailBook->luotDoc}}</p>
                            <p class="" style="color: #000;">Lượt mượn: {{$detailBook->luotMuon}}</p>
                        </div>
                        <div class="w-100"></div>
                        @if($detailBook-> soLuongCoSan > 1)
                        @if(isset($user))
                        <div class="input-group col-md-8 mb-4 d-flex">
                            <span class="input-group-btn mr-2">
                                <button type="button" class="quantity-left-minus btn" data-type="minus" data-field="">
                                    <i class="ion-ios-remove"></i>
                                </button>
                            </span>
                            <input type="text" id="quantity" name="soLuong" class="quantity form-control input-number" value="1" min="1" max="{{$user->id_VaiTro < 4 ? 5 : 3}}">
                            <span class="input-group-btn ml-2">
                                <button type="button" class="quantity-right-plus btn" data-type="plus" data-field="">
                                    <i class="ion-ios-add"></i>
                                </button>
                            </span>
                            @if($errors->has('soLuong'))
                            <span class="text-danger"><i>*{{$errors->first('soLuong')}}</i></span>
                            @endif 
                        </div>
                        <input type="hidden" name="id_Sach" value="{{ \Illuminate\Support\Facades\Crypt::encryptString($detailBook->id_Sach) }}">
                    </form>
                </div>
                <p class="">
                    <a href="javascript:void(0)" class="btn btn-primary py-3 px-5" onclick="document.getElementById('cart-form').submit();">Thêm vào giỏ</a>
                </p>
                @endif
                @endif
            </div>
        </div>




        <div class="row mt-5">
            <div class="col-md-12 nav-link-wrap">
                <div class="nav nav-pills d-flex text-center" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                    <a class="nav-link ftco-animate active mr-lg-1" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab" aria-controls="v-pills-1" aria-selected="true">Mô tả</a>

                    <a class="nav-link ftco-animate mr-lg-1" id="v-pills-2-tab" data-toggle="pill" href="#v-pills-2" role="tab" aria-controls="v-pills-2" aria-selected="false">Manufacturer</a>

                    <a class="nav-link ftco-animate" id="v-pills-3-tab" data-toggle="pill" href="#v-pills-3" role="tab" aria-controls="v-pills-3" aria-selected="false">Đánh Giá</a>

                </div>
            </div>
            <div class="col-md-12 tab-wrap">

                <div class="tab-content bg-light" id="v-pills-tabContent">

                    <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="day-1-tab">
                        <div class="p-4">
                            {!!$detailBook -> ghiChu!!}
                        </div>
                    </div>

                    <div class="tab-pane fade" id="v-pills-2" role="tabpanel" aria-labelledby="v-pills-day-2-tab">
                        <div class="p-4">
                            <h3 class="mb-4">Manufactured By Nike</h3>
                            <p>On her way she met a copy. The copy warned the Little Blind Text, that where it came from it would have been rewritten a thousand times and everything that was left from its origin would be the word "and" and the Little Blind Text should turn around and return to its own, safe country. But nothing the copy said could convince her and so it didn’t take long until a few insidious Copy Writers ambushed her, made her drunk with Longe and Parole and dragged her into their agency, where they abused her for their.</p>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="v-pills-3" role="tabpanel" aria-labelledby="v-pills-day-3-tab">
                        <div class="row p-4">
                            <div class="col-md-7">
                                <h3 class="mb-4">23 Reviews</h3>
                                <div class="review">
                                    <div class="user-img" style="background-image: url(images/person_1.jpg)"></div>
                                    <div class="desc">
                                        <h4>
                                            <span class="text-left">Jacob Webb</span>
                                            <span class="text-right">14 March 2018</span>
                                        </h4>
                                        <p class="star">
                                            <span>
                                                <i class="ion-ios-star-outline"></i>
                                                <i class="ion-ios-star-outline"></i>
                                                <i class="ion-ios-star-outline"></i>
                                                <i class="ion-ios-star-outline"></i>
                                                <i class="ion-ios-star-outline"></i>
                                            </span>
                                            <span class="text-right"><a href="#" class="reply"><i class="icon-reply"></i></a></span>
                                        </p>
                                        <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrov</p>
                                    </div>
                                </div>
                                <div class="review">
                                    <div class="user-img" style="background-image: url(images/person_2.jpg)"></div>
                                    <div class="desc">
                                        <h4>
                                            <span class="text-left">Jacob Webb</span>
                                            <span class="text-right">14 March 2018</span>
                                        </h4>
                                        <p class="star">
                                            <span>
                                                <i class="ion-ios-star-outline"></i>
                                                <i class="ion-ios-star-outline"></i>
                                                <i class="ion-ios-star-outline"></i>
                                                <i class="ion-ios-star-outline"></i>
                                                <i class="ion-ios-star-outline"></i>
                                            </span>
                                            <span class="text-right"><a href="#" class="reply"><i class="icon-reply"></i></a></span>
                                        </p>
                                        <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrov</p>
                                    </div>
                                </div>
                                <div class="review">
                                    <div class="user-img" style="background-image: url(images/person_3.jpg)"></div>
                                    <div class="desc">
                                        <h4>
                                            <span class="text-left">Jacob Webb</span>
                                            <span class="text-right">14 March 2018</span>
                                        </h4>
                                        <p class="star">
                                            <span>
                                                <i class="ion-ios-star-outline"></i>
                                                <i class="ion-ios-star-outline"></i>
                                                <i class="ion-ios-star-outline"></i>
                                                <i class="ion-ios-star-outline"></i>
                                                <i class="ion-ios-star-outline"></i>
                                            </span>
                                            <span class="text-right"><a href="#" class="reply"><i class="icon-reply"></i></a></span>
                                        </p>
                                        <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrov</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="rating-wrap">
                                    <h3 class="mb-4">Give a Review</h3>
                                    <p class="star">
                                        <span>
                                            <i class="ion-ios-star-outline"></i>
                                            <i class="ion-ios-star-outline"></i>
                                            <i class="ion-ios-star-outline"></i>
                                            <i class="ion-ios-star-outline"></i>
                                            <i class="ion-ios-star-outline"></i>
                                            (98%)
                                        </span>
                                        <span>20 Reviews</span>
                                    </p>
                                    <p class="star">
                                        <span>
                                            <i class="ion-ios-star-outline"></i>
                                            <i class="ion-ios-star-outline"></i>
                                            <i class="ion-ios-star-outline"></i>
                                            <i class="ion-ios-star-outline"></i>
                                            <i class="ion-ios-star-outline"></i>
                                            (85%)
                                        </span>
                                        <span>10 Reviews</span>
                                    </p>
                                    <p class="star">
                                        <span>
                                            <i class="ion-ios-star-outline"></i>
                                            <i class="ion-ios-star-outline"></i>
                                            <i class="ion-ios-star-outline"></i>
                                            <i class="ion-ios-star-outline"></i>
                                            <i class="ion-ios-star-outline"></i>
                                            (98%)
                                        </span>
                                        <span>5 Reviews</span>
                                    </p>
                                    <p class="star">
                                        <span>
                                            <i class="ion-ios-star-outline"></i>
                                            <i class="ion-ios-star-outline"></i>
                                            <i class="ion-ios-star-outline"></i>
                                            <i class="ion-ios-star-outline"></i>
                                            <i class="ion-ios-star-outline"></i>
                                            (98%)
                                        </span>
                                        <span>0 Reviews</span>
                                    </p>
                                    <p class="star">
                                        <span>
                                            <i class="ion-ios-star-outline"></i>
                                            <i class="ion-ios-star-outline"></i>
                                            <i class="ion-ios-star-outline"></i>
                                            <i class="ion-ios-star-outline"></i>
                                            <i class="ion-ios-star-outline"></i>
                                            (98%)
                                        </span>
                                        <span>0 Reviews</span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="{{asset('pages/js/numberCart.js')}}"></script>

@endsection