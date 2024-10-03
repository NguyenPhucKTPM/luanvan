@extends('pages.main')
@section('layouts')
<section class="ftco-section contact-section bg-light mb-5">
    <div class="container">
        <div class="row d-flex mb-5 contact-info">
            <div class="w-100"></div>         
            <div class="col-md-4 d-flex">
                <div class="info bg-white p-4">
                    <p >
                        <span>Email:</span>
                        <a href="mailto:info@yoursite.com">htnha2000231@student.ctuet.edu.vn</a>
                    </p>
                </div>
            </div>
            <div class="col-md-4 d-flex">
                <div class="info bg-white p-4">
                    <p>
                        <span class="d-block">Số điện thoại:</span> 
                        <a href="tel://1234567920">0938 960 485</a>
                    </p>
                </div>
            </div>
            <div class="col-md-4 d-flex">
                <div class="info bg-white p-4">
                    <p><span class="d-block">Website</span> <a href="#">LibraryCTUET.vn</a></p>
                </div>
            </div>
        </div>
        <div class="row block-9">
            <div class="col-md-6 order-md-last d-flex">
                <form action="#" class="bg-white p-5 contact-form">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Họ tên">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Địa chỉ Email">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Tiêu đề">
                    </div>
                    <div class="form-group">
                        <textarea name="" id="" cols="30" rows="7" class="form-control"
                            placeholder="Chi tiết...."></textarea>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary py-3 px-5">Gửi</button>
                    </div>
                </form>

            </div>

            <div class="col-md-6 d-flex">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3928.6370299111713!2d105.7654703758868!3d10.046780690061096!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a0880f08006ffb%3A0x9a745510330faf4e!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBL4bu5IHRodeG6rXQgLSBDw7RuZyBuZ2jhu4cgQ-G6p24gVGjGoQ!5e0!3m2!1svi!2s!4v1727937123695!5m2!1svi!2s"
                    width="100%" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade">
                </iframe>
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