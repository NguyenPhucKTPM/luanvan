<div class="py-1 bg-black">
    <div class="container-fluid">
        <div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
            <div class="col-lg-12 d-block">
                <div class="row d-flex">
                    <div class="col-md pr-4 d-flex topper align-items-center">
                        <div class="icon mr-2 d-flex justify-content-center align-items-center"><span
                                class="fas fa-phone"></span></div>
                        <span class="text">+ 1235 2355 98</span>
                    </div>
                    <div class="col-md pr-4 d-flex topper align-items-center">
                        <div class="icon mr-2 d-flex justify-content-center align-items-center"><span
                                class="fas fa-paper-plane"></span></div>
                        <span class="text">youremail@email.com</span>
                    </div>
                    <div class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
                        <span class="text">Tất Cả Vì Sinh Viên Thân Yêu</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar ftco-navbar-light" id="ftco-navbar">
    <div class="container-fluid">
        <a class="navbar-brand" href="{{route('home')}}"><img src="{{asset('pages/images/logo_ctut1.png')}}"
                alt="logo"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
            aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>

        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active"><a href="index.html" class="nav-link" style="color: #0e4582;">Trang
                        chủ</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false">Thể loại</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown04">
                        @foreach ($menuCategories as $data)
                        <a class="dropdown-item" href="{{ route('listBookByCategory', ['category' => $data->id_TheLoai]) }}">{{$data->tenTheLoai}}</a>
                        @endforeach  
                    </div>
                </li>
                <li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
                <li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>
                <li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
                @if(isset($user))
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="taikhoan" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false">{{$user->tenNguoiDung}}</a>
                    <div class="dropdown-menu" aria-labelledby="taikhoan">
                        <a class="dropdown-item" href="{{route('thong-tin')}}">Xem thông tin</a>
                        <a class="dropdown-item" href="{{route('newPassword')}}">Đổi mật khẩu</a>
                        <a class="dropdown-item" href="{{route('dang-xuat')}}">Đăng xuất</a>
                    </div>
                </li>
                <li class="nav-item cta cta-colored"><a href="{{route('showCart')}}" class="nav-link"><span
                class="icon-shopping_cart" style="color: #0e4582;"></span>[{{$sumCart}}]</a></li>
                @else
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="taikhoan" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false">Tài khoản</a>
                    <div class="dropdown-menu" aria-labelledby="taikhoan">
                        <a class="dropdown-item" href="{{route('dang-nhap')}}">Đăng nhập</a>
                        <a class="dropdown-item" href="{{route('dang-ky')}}">Đăng ký</a>

                    </div>
                </li>
                @endif
               

            </ul>
        </div>

        <div class="collapse navbar-collapse" id="ftco-nav">
            <div class="action-menu ml-4">
                <div class="search-bar" id="search-bar">
                    <a href="#" class="search-button search-toggle" data-selector="#header-wrap">
                        <i class="fas fa-search"></i>
                    </a>
                    <form role="search" method="get" class="search-box">
                        <input class="search-field text search-input" placeholder="Search" type="search">
                    </form>
                </div>
            </div>
        </div>

    </div>
</nav>