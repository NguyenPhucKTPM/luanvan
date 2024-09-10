@extends('pages.index')
@section('content')
<div class="hero-wrap hero-bread" style="background-image: url({{ asset('pages/images/bg_6.jpg') }});">
    <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center fadeInUp ftco-animated">
                <p class="breadcrumbs"><span class="mr-2"><a href="#">{{$tab}}</a></span>
                </p>
                <h1 class="mb-0 bread">{{$title}}</h1>
            </div>
        </div>
    </div>
</div>
@yield('layouts')
@endsection