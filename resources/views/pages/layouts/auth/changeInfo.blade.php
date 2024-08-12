@extends('pages.index')
@section('title', $title )
@section('content')

<div class="hero-wrap hero-bread" style="background-image: url('pages/images/bg_6.jpg');">
    <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center fadeInUp ftco-animated">
                <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Người dùng</a></span>
                </p>
                <h1 class="mb-0 bread">{{$title}}</h1>
            </div>
        </div>
    </div>
</div>


<section class="ftco-section ">
    <div class=" container">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-10 ftco-animate fadeInUp ftco-animated">
                    <form action="{{route ('updateInfo')}}" class="billing-form" method="POST">
                        @csrf
                        <h3 class="mb-4 billing-heading">{{$title}}</h3>
                        <div class=" row align-items-end">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="tenNguoiDung">Họ tên
                                        @if ($errors->has('tenNguoiDung'))
                                        <span class="text-danger ml-2">
                                            *{{ $errors->first('tenNguoiDung') }}
                                        </span>
                                        @endif
                                    </label>
                                    <input type="text" id="tenNguoiDung" name="tenNguoiDung"
                                        class="form-control text-black" value="{{$user -> tenNguoiDung}}">
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="SDT">Số điện thoại
                                        @if ($errors->has('SDT'))
                                        <span class="text-danger ml-2">
                                            *{{ $errors->first('SDT') }}
                                        </span>
                                        @endif
                                    </label>
                                    <input type="text" name="SDT" id="SDT" class="form-control"
                                        value="0{{$user -> SDT}}">
                                </div>
                            </div>

                            <div class="w-100"></div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="gioiTinh">Giới tính
                                        @if ($errors->has('gioiTinh'))
                                        <span class="text-danger ml-2">
                                            *{{ $errors->first('gioiTinh') }}
                                        </span>
                                        @endif
                                    </label>
                                    <div class="select-wrap">
                                        <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                        <select name="gioiTinh" id="gioiTinh" class="form-control">
                                            <option value="Nam" {{$user -> gioiTinh == 'Nam' ? 'selected' : '' }}>Nam
                                            </option>
                                            <option value="Nữ" {{$user -> gioiTinh == 'Nữ' ? 'selected' : '' }}>Nữ
                                            </option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="ngaySinh">Ngày sinh
                                        @if ($errors->has('ngaySinh'))
                                        <span class="text-danger ml-2">
                                            *{{ $errors->first('ngaySinh') }}
                                        </span>
                                        @endif
                                    </label>
                                    <!-- <input type="text" class="form-control" placeholder=""> -->
                                    <input id="ngaySinh" type="text"
                                        class="form-control birthdate-picker flatpickr-input active" name="ngaySinh"
                                        placeholder="YYYY-MM-DD" readonly="readonly" value="{{$user -> ngaySinh}}">
                                </div>
                            </div>

                            <div class="w-100"></div>
                            <!-- khoa, khóa học, lớp -->
                            @if(isset($infoRole))
                            <div class="{{$user -> id_VaiTro == 4 ? 'col-md-4' : 'col-md-12'}}">
                            <div class="form-group">
                                    <label for="id_Khoa">Khoa
                                    @if ($errors->has('id_Khoa'))
                                        <span class="text-danger ml-2">
                                            *{{ $errors->first('id_Khoa') }}
                                        </span>
                                        @endif
                                    </label>
                                    <div class="select-wrap">
                                        <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                        <select name="id_Khoa" id="id_Khoa" class="form-control">
                                            <option value="{{$infoRole -> id_Khoa}}">{{$infoRole -> tenKhoa}}</option>
                                            @foreach ($faculties as $data)
                                            <option value="{{$data -> id_Khoa}}">{{$data -> tenKhoa}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                            </div>
                            @if($user -> id_VaiTro == 4)
                            <div class="col-md-4">
                            <div class="form-group">
                                    <label for="id_KhoaHoc">Khóa học
                                        @if ($errors->has('id_KhoaHoc'))
                                        <span class="text-danger ml-2">
                                            *{{ $errors->first('id_KhoaHoc') }}
                                        </span>
                                        @endif
                                    </label>
                                    <div class="select-wrap">
                                        <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                        <select name="id_KhoaHoc" id="id_KhoaHoc" class="form-control">
                                            <option value="{{$infoRole -> id_KhoaHoc}}">{{$infoRole -> tenKhoaHoc}}</option>
                                            @foreach ($courses as $data)
                                            <option value="{{$data -> id_KhoaHoc}}">{{$data -> tenKhoaHoc}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                            <div class="form-group">
                                    <label for="id_Lop">Lớp học
                                        @if ($errors->has('id_Lop'))
                                        <span class="text-danger ml-2">
                                            *{{ $errors->first('id_Lop') }}
                                        </span>
                                        @endif
                                    </label>
                                    <div class="select-wrap">
                                        <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                        <select name="id_Lop" id="id_Lop" class="form-control">
                                            <option value="{{$infoRole -> id_Lop}}">{{$infoRole -> tenLop}}</option>
                                            @foreach ($classRoom as $data)
                                            <option value="{{$data -> id_Lop}}">{{$data -> tenLop}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                            </div>
                            @endif
                            @endif
                            <div class="w-100"></div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="diaChi">Địa chỉ
                                        @if ($errors->has('diaChi'))
                                        <span class="text-danger ml-2">
                                            *{{ $errors->first('diaChi') }}
                                        </span>
                                        @endif
                                    </label>
                                    <textarea class="form-control" id="diaChi" name="diaChi" rows="4"
                                        style=" height: 150px;">{{ old('diaChi', $user->diaChi) }}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-5 pt-3 d-flex justify-content-center">
                            <div class="col-md-6">
                                <div class="cart-detail bg-light p-3 p-md-4">
                                    <p><button class="btn btn-primary py-3 px-4">Lưu thay đổi</button></p>
                                </div>
                            </div>
                        </div>
                    </form><!-- END -->
                </div> <!-- .col-md-8 -->
            </div>
        </div>
    </div>
</section>

< @endsection