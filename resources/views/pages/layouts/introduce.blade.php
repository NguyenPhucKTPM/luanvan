@extends('pages.main')
@section('layouts')
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

<section class="ftco-gallery mt-5">
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