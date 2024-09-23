@extends('pages.main')
@section('layouts')
<section class="ftco-section">
    @foreach ( $getBorrow as $borrow)
    <div class="container mb-4">
        <div class="custom-card">
            <div class="custom-card-body">
                <div class="row d-flex mb-3 ">
                    <div class="col-md-12 col-lg-4 text-dark">
                        <h6 style="color:black;">Mã phiếu trả: #{{$borrow->maPhieuTra}}</h6>
                    </div>
                    <div class="col-md-12 col-lg-4 text-dark  text-left">
                        <h6 style="color:black;">Tiền đã cọc: {{ number_format($borrow->tienCoc, 0, ',', '.') }}₫</h6>
                    </div>
                    <div class="col-md-12 col-lg-4 text-dark  text-md-center text-left">
                        <h6 style="color:black;">Cách mượn: {{$borrow->hinhThucMuon }}</h6>
                    </div>
                    <div class="col-md-12 col-lg-4">
                        <h6 style="color:black;">Trạng thái: <strong class="text-success">{{$borrow->statusBorrow}}</strong></h6>
                    </div>
                    <div class="col-md-12 col-lg-4 text-dark">
                        <h6 style="color:black;">Ngày mượn: {{ \Carbon\Carbon::parse($borrow->ngayMuon)->format('d/m/Y') }}</h6>
                    </div>
                    <div class="col-md-12 col-lg-4 text-dark  text-md-center text-left">
                        <h6 style="color:black;">Ngày trả thực tế: {{ \Carbon\Carbon::parse($borrow->ngayTraThucTe)->format('d/m/Y') }}</h6>
                    </div>
                    @if($borrow->mistakes->isNotEmpty())
                    <div class="col-md-12 col-lg-4 text-dark">
                        <h6 class="text-danger">Vi phạm:
                            {{ $borrow->mistakes->pluck('tenViPham')->unique()->implode(', ') }}          
                        </h6>
                    </div>
                    @endif
                </div>

                <hr>
                @foreach ($borrow->details as $data )
                <div class="row mb-3">
                    <div class="col-lg-4 col-md-12">
                        <img src="{{$data->duongDan}}" alt="Product Image" class="custom-product-image">
                    </div>
                    <div class="col-lg-8 col-md-12">
                        <h5 class="custom-product-name"><a href="{{ route('pageDetailBook', $data->id_Sach) }}">{{$data -> tenSach}}</a></h5>
                        <p class="start">
                            @php
                            $star = min($data->danhGiaTrungBinh, 5);
                            @endphp
                            @for ($i = 1; $i <= 5; $i++)
                                @if ($i <=$star)
                                <i class="ion-ios-star" style="color:#f1b609"></i>
                                @else
                                <i class="ion-ios-star-outline" style="color:#f1b609"></i>
                                @endif
                                @endfor
                        </p>
                        <p>Tác giả: {{$data->tenTacGia}}</p>
                        <p class="custom-product-quantity">Số lượng: {{$data->soLuongSachMuon}}</p>
                        <p>Thể loại:
                            @foreach ($data->category as $category )
                            <a href="{{ route('listBookByCategory', ['category' => $category->id_TheLoai]) }}">
                                <span class="badge rounded-pill  bg-info mr-1 text-light" style="font-size:85%;padding:0.35em 1.2em;">{{$category->tenTheLoai}}</span>
                            </a>
                            @endforeach
                        </p>
                    </div>
                </div>
                @endforeach
            </div>
        </div>
    </div>
    @endforeach
    <div class="container mb-4">
        <div class="row">
            <div class="col text-center">
                <div class="block-27">
                    <ul>
                        <!-- Previous Page Link -->
                        <li class="{{ $getBorrow->onFirstPage() ? 'disabled' : '' }}">
                            <a href="{{ $getBorrow->onFirstPage() ? '#' : $getBorrow->previousPageUrl() }}">&lt;</a>
                        </li>

                        <!-- Page Number Links -->
                        @for ($i = 1; $i <= $getBorrow->lastPage(); $i++)
                            @if ($i == 1 || $i == $getBorrow->lastPage() || ($i >= $getBorrow->currentPage() - 2 && $i <= $getBorrow->currentPage() + 2))
                                <li class="{{ $getBorrow->currentPage() == $i ? 'active' : '' }}">
                                    <a href="{{ $getBorrow->url($i) }}">{{ $i }}</a>
                                </li>
                                @elseif ($i == $getBorrow->currentPage() - 3 || $i == $getBorrow->currentPage() + 3)
                                <li class="disabled"><span>...</span></li>
                                @endif
                                @endfor

                                <!-- Next Page Link -->
                                <li class="{{ $getBorrow->hasMorePages() ? '' : 'disabled' }}">
                                    <a href="{{ $getBorrow->hasMorePages() ? $getBorrow->nextPageUrl() : '#' }}">&gt;</a>
                                </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection