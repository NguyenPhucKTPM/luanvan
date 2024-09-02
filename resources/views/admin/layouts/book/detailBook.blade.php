@extends('admin.main')
@section('layouts')
<section class="app-ecommerce-details">
  <div class="card">
    <!-- Product Details starts -->
    <div class="card-body">
      <div class="row my-2">
        <div class="col-12 col-md-5 d-flex align-items-center justify-content-start mb-2 mb-md-0">
          <div class="d-flex align-items-center justify-content-center">
            <img
              src="{{$detailBook -> duongDan}}"
              class="img-fluid product-img"
              alt="product image" />
          </div>
        </div>
        <div class="col-12 col-md-7">
          <h4>{{$detailBook -> tenSach}} - {{$detailBook -> maSach}}</h4>
          <div class="ecommerce-details-price d-flex flex-wrap mt-1">
            <h4 class="item-price me-1">{{number_format($detailBook->giaTien, 0, ',', '.')}}₫</h4>
            <ul class="unstyled-list list-inline ps-1 border-start">
              <li class="ratings-list-item"><i data-feather="star" class="filled-star"></i></li>
              <li class="ratings-list-item"><i data-feather="star" class="filled-star"></i></li>
              <li class="ratings-list-item"><i data-feather="star" class="filled-star"></i></li>
              <li class="ratings-list-item"><i data-feather="star" class="filled-star"></i></li>
              <li class="ratings-list-item"><i data-feather="star" class="unfilled-star"></i></li>
            </ul>
          </div>

          <p class="card-text"></p>
          <div class="col-xl-12 col-lg-12 mt-2 mt-xl-0">
            <div class="d-flex flex-wrap">
              <div class="info-book">
                <i class="info-icon" data-feather="user"></i>
                <span class="info-book-title">Tên tác giả: </span>
              </div>
              <p class="information-book">{{$detailBook->tenTacGia}}</p>
            </div>
          </div>
          <div class="col-xl-12 col-lg-12 mt-2 mt-xl-0">
            <div class="d-flex flex-wrap">
              <div class="info-book">
                <i class="info-icon" data-feather="feather"></i>
                <span class="info-book-title">Nhà xuất bản: </span>
              </div>
              <p class="information-book">{{$detailBook->tenNhaXuatBan}} - {{$detailBook->namXuatBan}}</p>
            </div>
          </div>
          <div class="col-xl-12 col-lg-12 mt-2 mt-xl-0">
            <div class="d-flex flex-wrap">
              <div class="info-book">
                <i class="info-icon" data-feather="type"></i>
                <span class="info-book-title">Ngôn ngữ: </span>
              </div>
              <p class="information-book">{{$detailBook->tenNgonNgu}}</p>
            </div>
          </div>
          <div class="col-xl-12 col-lg-12 mt-2 mt-xl-0">
            <div class="d-flex flex-wrap">
              <div class="info-book">
                <i class="info-icon" data-feather="book-open"></i>
                <span class="info-book-title">Số trang: </span>
              </div>
              <p class="information-book">{{$detailBook->soTrang}}</p>
            </div>
          </div>
          <div class="col-xl-12 col-lg-12 mt-2 mt-xl-0">
            <div class="d-flex flex-wrap">
              <div class="info-book">
                <i class="info-icon" data-feather="tag"></i>
                <span class="info-book-title">Thể loại: </span>
              </div>
              @foreach ($categories as $data )
              <!-- <p class="information-book"></p> -->
              <p><span class="badge rounded-pill  bg-info me-1">{{$data->tenTheLoai}}</span></p>
              @endforeach
            </div>
          </div>
          <div class="col-xl-12 col-lg-12 mt-2 mt-xl-0">
            <div class="d-flex flex-wrap">
              <div class="info-book">
                <i class="info-icon" data-feather="hexagon"></i>
                <span class="info-book-title">Ngành học: </span>
              </div>
              @foreach ($disciplines as $data )
              <!-- <p class="information-book"></p> -->
              <p><span class="badge rounded-pill badge-glow bg-success me-1">{{$data->tenNganhHoc}}</span></p>
              @endforeach
            </div>
          </div>
          <div class="col-xl-12 col-lg-12 mt-2 mt-xl-0">
            <div class="d-flex flex-wrap">
              <div class="info-book">
                <i class="info-icon" data-feather="link-2"></i>
                <span class="info-book-title">Đường dẫn: </span>
              </div>
              <p class="information-book">
                <a href="{{$detailBook->fileSach == 'null' ? '#' : $detailBook->fileSach }}" target="{{ $detailBook->fileSach == 'null' ? '_self' : '_blank' }}">
                  {{$detailBook->fileSach == null ? 'Không có' : 'Đọc sách online ở đây'}}
                </a>
              </p>
            </div>
          </div>
          <div class="col-xl-12 col-lg-12 mt-2 mt-xl-0">
            <div class="d-flex flex-wrap">
              <div class="info-book">
                <i class="info-icon" data-feather="codepen"></i>
                <span class="info-book-title">Vị trí sách: </span>
              </div>
              <p class="information-book">{{$detailBook->tenViTri}}</p>
            </div>
          </div>
          <hr />
          <p class="card-text">Tổng số lượng - <span class="text-success">{{$detailBook -> soLuongHienCo}} sách</span></p>
          <p class="card-text">Số lượng khả dụng - <span class="text-success">{{$detailBook -> soLuongCoSan}} sách</span></p>
          <p class="card-text">Số lượt xem - <span class="text-success">{{$detailBook -> luotXem}} lần</span></p>
          <p class="card-text">Số lượt đọc - <span class="text-success">{{$detailBook -> luotDoc}} lần</span></p>
          <p class="card-text">Số lượt mượn - <span class="text-success">{{$detailBook -> luotMuon}} lần</span></p>
          <hr />
          <p class="card-text">Ngày nhập sách : <span class="text-danger">{{ \Carbon\Carbon::parse($detailBook->ngayTaoSach)->format('d-m-Y H:i:s') }}</span></p>
          <p class="card-text">Ngày cập nhật sách : <span class="text-danger"> {{$detailBook->ngaySuaSach == $detailBook -> ngayTaoSach ? 'Chưa cập nhật' : \Carbon\Carbon::parse($detailBook->ngaySuaSach)->format('d-m-Y H:i:s') }}</span></p>
        </div>
      </div>
    </div>
    <!-- Product Details ends -->



    <!-- Related Products starts -->
    <div class="card-body">
      <div class="row">
        <div class="col-12 col-md-12 ">
          <div class="mt-4 mb-2 text-center">
            <h2>Mô tả về sách</h2>
          </div>
        </div>
        <div class="description-book col-12 col-md-12 ">{!!$detailBook -> ghiChu!!}</div>
      </div>
    </div>
    <!-- Related Products ends -->
  </div>
</section>
@endsection