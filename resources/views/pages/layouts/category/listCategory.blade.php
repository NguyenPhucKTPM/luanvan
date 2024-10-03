@extends('pages.main')
@section('layouts')
<section class="ftco-section bg-light">
    <div class="container">
        <div class="row mb-4">
            <div class="col-sm-12 col-md-6 col-lg-3">
                <h3 style="color: #0e4582">TẤT CẢ THỂ LOẠI:</h3>
            </div>
            <div id="search-form" class="col-sm-12 col-md-6 col-lg-9 search-form">
                <div class="form-group">
                    <span class="icon ion-ios-search"></span>
                    <input type="text" id="search-input" class="form-control" placeholder="Tìm kiếm...">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col order-md-last">
                <div id="book-list" class="row">
                    @foreach ($menuCategories as $data)
                    <div class="col-6 col-sm-4 col-md-3 col-lg-2 ftco-animate  book-item" data-title="{{ $data->tenTheLoai }}">
                        <div class="product d-flex flex-column" style="background: #f8f9fa;">
                            <a href="{{ route('listBookByCategory', ['category' => $data->id_TheLoai]) }}" class="img-prod">
                                <img class="img-fluid" src="{{ asset('pages/images/category.jpg') }}" alt="Sách">
                                <div class="overlay"></div>
                            </a>
                            <div class="text py-2 pb-2 px-2">
                                <h3>
                                    <a style="text-align: center; display: block;" href="{{ route('listBookByCategory', ['category' => $data->id_TheLoai]) }}">{{$data -> tenTheLoai}}</a>
                                </h3>
                            </div>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</section>
<script src="{{asset('pages/js/searchBook.js')}}"></script>
@endsection