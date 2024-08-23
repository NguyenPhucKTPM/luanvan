@extends('admin.index')
@section('content')
<div class="app-content content ">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper container-xxl p-0">
        <div class="content-header row">
            <div class="content-header-left col-md-9 col-12 mb-2">
                <div class="row breadcrumbs-top">
                    <div class="col-12">
                        <h2 class="content-header-title float-start mb-0">{{$title}}</h2>
                        <div class="breadcrumb-wrapper">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{route('dashboard')}}">Trang chủ</a>
                                </li>
                                <li class="breadcrumb-item"><a href="#">{{$tab}}</a>
                                </li>
                                <li class="breadcrumb-item active">{{$title}}
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        @yield('layouts')
    </div>
</div>
@endsection 