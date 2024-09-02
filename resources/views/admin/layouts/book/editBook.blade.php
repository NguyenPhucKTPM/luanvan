@extends('admin.main')
@section('layouts')
<section id="basic-input">
    <form id="main-form" action="{{route('editBook')}}" method="post" enctype="multipart/form-data">
        @csrf
        <input type="hidden" name="id_Sach" value="{{ \Illuminate\Support\Facades\Crypt::encryptString($detailBook->id_Sach) }}">

        <div class="row align-items-stretch">
            <div class="col-md-10 mb-3">
                <div class="card h-100">
                    <div class="card-header">
                        <h4 class="card-title">Thông tin sách</h4>
                    </div>
                    <div class="card-body">
                        <div class="row ">
                            <div class="col-xl-6 col-md-6 col-12">
                                <div class="mb-1">
                                    <label class="form-label" for="tenSach">Tên sách*</label>
                                    <input type="text" class="form-control" id="tenSach" name="tenSach" value="{{$detailBook -> tenSach}}">
                                    @if($errors->has('tenSach'))
                                    <span class="error-message text-danger">*
                                        {{$errors->first('tenSach')}}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="col-xl-6 col-md-6 col-12">
                                <div class="mb-1">
                                    <label class="form-label" for="tenTacGia">Tên tác giả*</label>
                                    <input type="text" class="form-control" id="tenTacGia" name="tenTacGia" value="{{$detailBook -> tenTacGia}}">
                                    @if($errors->has('tenTacGia'))
                                    <span class="error-message text-danger">*
                                        {{$errors->first('tenTacGia')}}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="col-xl-6 col-md-6 col-12">
                                <div class="mb-1">
                                    <label class="form-label" for="giaTien">Giá tiền*</label>
                                    <input type="text" class="form-control" id="giaTien" name="giaTien" value="{{number_format($detailBook->giaTien, 0, ',', '.')}}">
                                    @if($errors->has('giaTien'))
                                    <span class="error-message text-danger">*
                                        {{$errors->first('giaTien')}}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 col-12">
                                <div class="mb-1">
                                    <label class="form-label" for="soTrang">Số trang*</label>
                                    <div class="input-group disabled-touchspin" style="width:100%;">
                                        <input type="number" class="touchspin" id="soTrang" name="soTrang" value="{{$detailBook -> soTrang}}" />
                                    </div>
                                    @if($errors->has('soTrang'))
                                    <span class="error-message text-danger">*
                                        {{$errors->first('soTrang')}}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 col-12">
                                <div class="mb-1">
                                    <label class="form-label" for="soLuongHienCo">Số lượng sách*</label>
                                    <div class="input-group disabled-touchspin" style="width:100%;">
                                        <input type="number" class="touchspin" id="soLuongHienCo" name="soLuongHienCo" value="{{$detailBook -> soLuongHienCo}}" />
                                    </div>
                                    @if($errors->has('soLuongHienCo'))
                                    <span class="error-message text-danger">*
                                        {{$errors->first('soLuongHienCo')}}</span>
                                    @endif
                                </div>
                            </div>

                            <div class="col-xl-6 col-md-6 col-12">
                                <div class="mb-1">
                                    <label class="form-label" for="namXuatBan">Năm xuất bản*</label>
                                    <input type="text" class="form-control" id="namXuatBan" name="namXuatBan" value="{{$detailBook -> namXuatBan}}">
                                    @if($errors->has('namXuatBan'))
                                    <span class="error-message text-danger">*
                                        {{$errors->first('namXuatBan')}}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="col-xl-6 col-md-6 col-12">
                                <div class="mb-1">
                                    <label class="form-label" for="fileSach">Đường dẫn sách</label>
                                    <input type="text" class="form-control" id="fileSach" name="fileSach" value="{{$detailBook -> fileSach}}">
                                </div>
                            </div>

                            <div class="col-xl-6 col-md-6 col-12">
                                <div class="mb-1">
                                    <label class="form-label" for="id_NhaXuatBan">Nhà xuất bản</label>
                                    <select class="select2 form-select" id="id_NhaXuatBan" name="id_NhaXuatBan">
                                        <option value="{{$detailBook -> id_NhaXuatBan}}" selected>{{$detailBook -> tenNhaXuatBan}}</option>
                                        <option value="0">Bỏ chọn</option>
                                        @foreach ($getAllPublishers as $data )
                                        <option value="{{$data -> id_NhaXuatBan}}">{{$data -> tenNhaXuatBan}}</option>
                                        @endforeach
                                    </select>
                                    @if($errors->has('id_NhaXuatBan'))
                                    <span class="error-message text-danger">*
                                        {{$errors->first('id_NhaXuatBan')}}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="col-xl-6 col-md-6 col-12">
                                <div style="padding-top: 24px;">
                                    <button class="btn btn-icon btn-primary" style="width:100%" type="button" data-toggle="field" data-target="#new-publisher">
                                        <i data-feather="plus" class="me-25"></i>
                                        <span>Thêm mới nhà xuất bản</span>
                                    </button>
                                </div>
                            </div>
                            <div class="col-xl-12 col-md-12 col-12 field-container" id="new-publisher" style="display: {{$errors->has('tenNhaXuatBan') ? '' : 'none;'}}">
                                <div class="row align-items-center">
                                    <div class="col-xl-12 col-md-12 col-12">
                                        <div class="mb-1">
                                            <label class="form-label" for="tenNhaXuatBan">Thêm tên nhà xuất bản</label>
                                            <input type="text" class="form-control" id="tenNhaXuatBan" name="tenNhaXuatBan" placeholder="Nhập tên nhà xuất bản">
                                            @if($errors->has('tenNhaXuatBan'))
                                            <span class="error-message text-danger">*
                                                {{$errors->first('tenNhaXuatBan')}}</span>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-6 col-md-6 col-12">
                                <div class="mb-1">
                                    <label class="form-label" for="id_NgonNgu">Ngôn ngữ sách</label>
                                    <select class="select2 form-select" id="id_NgonNgu" name="id_NgonNgu">
                                        <option value="{{$detailBook -> id_NgonNgu}}" selected>{{$detailBook -> tenNgonNgu}}</option>
                                        <option value="0">Bỏ chọn</option>
                                        @foreach ($getAllLanguage as $data )
                                        <option value="{{$data -> id_NgonNgu}}">{{$data -> tenNgonNgu}}</option>
                                        @endforeach
                                    </select>
                                    @if($errors->has('id_NgonNgu'))
                                    <span class="error-message text-danger">*
                                        {{$errors->first('id_NgonNgu')}}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="col-xl-6 col-md-6 col-12 ">
                                <div style="padding-top: 24px;">
                                    <button class="btn btn-icon btn-primary" style="width:100%" type="button" data-toggle="field" data-target="#new-language">
                                        <i data-feather="plus" class="me-25"></i>
                                        <span class="">Thêm mới ngôn ngữ</span>
                                    </button>
                                </div>
                            </div>
                            <div class="col-xl-12 col-md-12 col-12" id="new-language" style="display: {{$errors->has('tenNgonNgu') ? '' : 'none;'}}">
                                <div class="row align-items-center">
                                    <div class="col-xl-12 col-md-12 col-12">
                                        <div class="mb-1">
                                            <label class="form-label" for="tenNgonNgu">Thêm tên ngôn ngữ*</label>
                                            <input type="text" class="form-control" id="tenNgonNgu" name="tenNgonNgu" placeholder="Nhập tên ngôn ngữ">
                                            @if($errors->has('tenNgonNgu'))
                                            <span class="error-message text-danger">*
                                                {{$errors->first('tenNgonNgu')}}</span>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-6 col-md-6 col-12">
                                <div class="mb-1">
                                    <label class="form-label" for="id_TheLoai">Thể loại sách</label>
                                    <select class="select2 form-select" id="id_TheLoai" name="id_TheLoai[]" multiple>
                                        @foreach ($categories as $data )
                                        <option value="{{$data -> id_TheLoai}}" selected>{{$data -> tenTheLoai}}</option>
                                        @endforeach
                                        @foreach ($getAllCategory->reject(function($item) use ($categories) {
                                        return $categories->pluck('id_TheLoai')->contains($item->id_TheLoai);
                                        })->unique('tenTheLoai') as $data )
                                        <option value="{{ $data->id_TheLoai }}">{{ $data->tenTheLoai }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-xl-6 col-md-6 col-12">
                                <div style="padding-top: 24px;">
                                    <button class="btn btn-icon btn-primary" style="width:100%" type="button" data-toggle="field" data-target="#new-category">
                                        <i data-feather="plus" class="me-25"></i>
                                        <span>Thêm mới thể loại</span>
                                    </button>
                                </div>
                            </div>
                            <div class="col-xl-12 col-md-12 col-12 field-container" id="new-category" style="display: {{$errors->has('tenTheLoai') ? '' : 'none;'}}">
                                <div class="row align-items-center">
                                    <div class="col-xl-12 col-md-12 col-12">
                                        <div class="mb-1">
                                            <label class="form-label" for="tenTheLoai">Thêm tên thể loại</label>
                                            <input type="text" class="form-control" id="tenTheLoai" name="tenTheLoai" placeholder="Nhập tên thể loại">
                                            @if($errors->has('tenTheLoai'))
                                            <span class="error-message text-danger">*
                                                {{$errors->first('tenTheLoai')}}</span>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-6 col-md-6 col-12">
                                <div class="mb-1">
                                    <label class="form-label" for="id_NganhHoc">Chọn ngành học</label>
                                    <select class="select2 form-select" id="id_NganhHoc" name="id_NganhHoc[]" multiple>
                                        @foreach ($disciplines as $data )
                                        <option value="{{$data -> id_NganhHoc}}" selected>{{$data -> tenNganhHoc}}</option>
                                        @endforeach
                                        @foreach ($getAllDiscipline->reject(function($item) use ($disciplines) {
                                        return $disciplines->pluck('id_NganhHoc')->contains($item->id_NganhHoc);
                                        })->unique('tenNganhHoc') as $data )
                                        <option value="{{ $data->id_NganhHoc }}">{{ $data->tenNganhHoc }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-xl-6 col-md-6 col-12">
                                <div style="padding-top: 24px;">
                                    <button class="btn btn-icon btn-primary" style="width:100%" type="button" data-toggle="field" data-target="#new-discipline">
                                        <i data-feather="plus" class="me-25"></i>
                                        <span>Thêm mới ngành học</span>
                                    </button>
                                </div>
                            </div>
                            <div class="col-xl-12 col-md-12 col-12 field-container" id="new-discipline" style="display: {{$errors->has('tenNganhHoc') ? '' : 'none;'}}">
                                <div class="row align-items-center">
                                    <div class="col-xl-12 col-md-12 col-12">
                                        <div class="mb-1">
                                            <label class="form-label" for="tenNganhHoc">Thêm tên ngành học</label>
                                            <input type="text" class="form-control" id="tenNganhHoc" name="tenNganhHoc" placeholder="Nhập tên ngành học">
                                            @if($errors->has('tenNganhHoc'))
                                            <span class="error-message text-danger">*
                                                {{$errors->first('tenNganhHoc')}}</span>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-12 col-md-12 col-12">
                                <div class="mb-1">
                                    <label class="form-label" for="id_ViTri">Chọn vị trí để sách</label>
                                    <select class="select2 form-select" id="id_ViTri" name="id_ViTri">
                                        <option value="{{$detailBook -> id_ViTri}}" selected>{{$detailBook -> tenViTri}} (khả dụng {{$detailBook->sucChua - $detailBook->viTriDaSuDung }} sách)</option>
                                        @foreach ($getAllBookLocation as $data )
                                        <option value="{{$data -> id_ViTri}}">{{$data -> tenViTri}} (khả dụng {{$data->sucChua - $data->viTriDaSuDung }} sách)</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- hình ảnh -->
            <div class="col-md-2 mb-3">
                <div class="col-12 h-100">
                    <div class="card h-100">
                        <div class="card-header">
                            <h4 class="card-title">Hình ảnh sách</h4>
                        </div>
                        <div class="card-body">
                        <div class="drop-zone">
                                <span class="drop-zone__prompt">Kéo thả hình ảnh hoặc click vào đây</span>
                                <input type="file" name="hinhAnh" class="drop-zone__input">
                            </div>
                        </div>
                        <div class="card-header">
                            <h4 class="card-title">Hình ảnh hiện tại</h4>
                        </div>
                        <div class="card-body d-flex justify-content-center">
                            <img src="{{$detailBook->duongDan}}" width="190" alt="">
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Mô tả sách</h4>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <textarea name="ghiChu">{{$detailBook->ghiChu}}</textarea>
                        </div>
                    </div>
                    <div class="row mt-3 mb-2">
                        <div class="col-sm-12 d-flex justify-content-center">
                            <div class="d-grid col-lg-2 col-md-12 mb-1 mb-lg-0">
                                <button type="submit" class="btn btn-relief-success waves-effect waves-float waves-light">Cập nhật sách</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>


    </form>
</section>
<script src="{{asset('app-assets/js/scripts/customAddBook.js')}}"></script>
<script src="{{asset('app-assets/js/scripts/customUpload.js')}}"></script>
<script>
    CKEDITOR.replace('ghiChu');
</script>
@endsection