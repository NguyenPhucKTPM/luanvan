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

<section class="ftco-section ftco-degree-bg" style="padding: 7em 0;">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 ftco-animate fadeInUp ftco-animated">
                <h2 class="mb-3">#1.Quy Tắc Mượn Sách</h2>
                <p>Trong hệ thống quản lý thư viện hiện đại, việc quy định rõ ràng các điều kiện mượn sách là một yếu tố quan trọng nhằm đảm bảo sự công bằng và hiệu quả trong việc quản lý nguồn tài liệu. Chúng tôi đã thiết kế một hệ thống mượn sách linh hoạt nhưng có cơ chế quản lý chặt chẽ, phù hợp với nhu cầu của từng đối tượng độc giả.</p>
                
                <p>Đối với sinh viên, chúng tôi áp dụng chính sách mượn sách với số lượng tối đa là 3 cuốn và thời hạn mượn là 10 ngày. Điều này giúp sinh viên có đủ thời gian để nghiên cứu và tiếp cận các tài liệu học tập, đồng thời vẫn đảm bảo nguồn sách được luân chuyển và chia sẻ một cách hiệu quả giữa các sinh viên.</p>
                
                <p>Riêng với giảng viên, do đặc thù công việc và nhu cầu nghiên cứu chuyên sâu, chúng tôi cho phép mượn tối đa 5 cuốn sách với thời hạn mượn lên đến 15 ngày. Chế độ ưu tiên này nhằm tạo điều kiện cho đội ngũ giảng viên có thể tiếp cận các nguồn tài liệu phục vụ cho công tác giảng dạy và nghiên cứu khoa học.</p>

                <p>
                    <img src="{{asset('pages/images/quytac.jpg')}}" alt="" class="img-fluid">
                </p>

                <p>Việc quy định rõ ràng số lượng và thời hạn mượn sách không chỉ giúp quản lý nguồn tài liệu một cách khoa học mà còn tạo nên sự minh bạch và công bằng. Mỗi độc giả đều được tiếp cận nguồn tài nguyên một cách bình đẳng, đồng thời góp phần nâng cao văn hóa sử dụng thư viện.</p>

                <h2 class="mb-3 mt-5">#2. Trách Nhiệm Bảo Quản Sách</h2>
                
                <p>Bảo quản sách là trách nhiệm quan trọng của mỗi độc giả, thể hiện sự tôn trọng đối với tri thức và nguồn tài liệu chung. Chúng tôi đặt ra các quy định nghiêm ngặt nhằm bảo vệ và gìn giữ nguồn sách quý giá của thư viện.</p>
                
                <p>Việc làm mất hoặc làm hỏng sách được coi là vi phạm nghiêm trọng. Bất kỳ độc giả nào để xảy ra tình trạng này đều phải chịu trách nhiệm bồi thường. Mức bồi thường được tính toán một cách công bằng và minh bạch dựa trên giá trị thị trường của cuốn sách tại thời điểm xảy ra sự cố.</p>
                <p>
                    <img src="{{asset('pages/images/baoquan.jpg')}}" alt="" class="img-fluid">
                </p>
                <p>Chúng tôi tin rằng, việc áp dụng chính sách bồi thường này không chỉ là biện pháp bảo vệ tài sản của thư viện mà còn là cơ hội để giáo dục ý thức trách nhiệm và sự tôn trọng đối với tri thức ở mỗi độc giả.</p>

                <h2 class="mb-3 mt-5">#3. Hình Thức Mượn Sách</h2>
                
                <p>Nhằm đáp ứng nhu cầu đa dạng của độc giả, chúng tôi phát triển hai hình thức mượn sách linh hoạt và tiện lợi: mượn tại trường và mượn từ xa.</p>
                
                <p><strong>Mượn Tại Trường:</strong></p>
                <p>Đây là hình thức truyền thống nhưng vẫn được cải tiến để tối ưu trải nghiệm người dùng. Độc giả cần thực hiện quy trình đăng ký và được duyệt phiếu mượn. Sau khi được phê duyệt, độc giả sẽ trực tiếp đến thư viện để nhận sách, mang theo đầy đủ thông tin mượn sách.</p>
                <p>
                    <img src="{{asset('pages/images/taitruong.jpg')}}" alt="" class="img-fluid">
                </p>
                <p>Quy trình này giúp thư viện kiểm soát chặt chẽ nguồn sách, đồng thời tạo cơ hội trực tiếp tương tác và hỗ trợ độc giả.</p>
                
                <p><strong>Mượn Từ Xa:</strong></p>
                <p>Để đáp ứng xu thế công nghệ và nhu cầu thuận tiện, chúng tôi phát triển hình thức mượn từ xa với các điều khoản cụ thể:</p>
                
                <p>- Độc giả phải thanh toán đầy đủ giá sách theo niêm yết của thư viện</p>
                <p>- Chi trả toàn bộ chi phí vận chuyển (cả lượt mượn và trả)</p>
                <p>- Được gia hạn thêm 5 ngày so với thời hạn ban đầu để tăng tính linh hoạt</p>
                <p>
                    <img src="{{asset('pages/images/tuxa.jpg')}}" alt="" class="img-fluid">
                </p>
                <p>Hình thức mượn từ xa không chỉ mang lại sự tiện lợi cho độc giả mà còn mở rộng khả năng tiếp cận nguồn tri thức, vượt qua giới hạn không gian và thời gian.</p>       
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