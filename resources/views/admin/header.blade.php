<nav
    class="header-navbar navbar navbar-expand-lg align-items-center floating-nav navbar-light navbar-shadow container-xxl">
    <div class="navbar-container d-flex content">
        <div class="bookmark-wrapper d-flex align-items-center">
            <ul class="nav navbar-nav d-xl-none">
                <li class="nav-item"><a class="nav-link menu-toggle" href="#"><i class="ficon"
                            data-feather="menu"></i></a></li>
            </ul>
            <ul class="nav navbar-nav bookmark-icons">
                <li class="nav-item d-none d-lg-block "><a class="nav-link" href="{{route('dashboard')}}"
                        data-bs-toggle="tooltip" data-bs-placement="bottom" title="Thống kê"><i class="ficon"
                            data-feather="trending-up"></i></a></li>
                <li class="nav-item d-none d-lg-block"><a class="nav-link" href="{{ route('listBook') }}" data-bs-toggle="tooltip"
                        data-bs-placement="bottom" title="Tất cả sách"><i class="ficon" data-feather="book-open"></i></a>
                </li>
                <li class="nav-item d-none d-lg-block"><a class="nav-link" href="{{route('listUser')}}"
                        data-bs-toggle="tooltip" data-bs-placement="bottom" title="Người dùng"><i class="ficon"
                            data-feather="user"></i></a></li>
            </ul>
           
        </div>
        <ul class="nav navbar-nav align-items-center ms-auto">
            <li class="nav-item dropdown dropdown-language">
                <a class="nav-link dropdown-toggle" id="dropdown-flag" href="#" data-bs-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false">
                    <i class="flag-icon flag-icon-vn"></i><span class="selected-language">Việt Nam</span>
                </a>
                
            </li>
            <li class="nav-item d-none d-lg-block">
                <a class="nav-link nav-link-style"><i class="ficon" data-feather="moon"></i></a>
            </li>
         
           
            <li class="nav-item dropdown dropdown-user">
                <a class="nav-link dropdown-toggle dropdown-user-link" id="dropdown-user" href="#"
                    data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <div class="user-nav d-sm-flex d-none">
                        <span class="user-name fw-bolder">{{isset($user) ? $user->tenNguoiDung : 'Lỗi' }}</span><span
                            class="user-status">{{ isset($user) ? $user->tenVaiTro : 'lỗi ' }}</span>
                    </div>
                    <span class="avatar">
                        <img class="round" src="{{ asset('app-assets/images/portrait/small/avatar-s-11.jpg') }}"
                            alt="avatar" height="40" width="40">
                        <span class="avatar-status-online"></span>
                    </span>
                </a>
                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdown-user">
                    <a class="dropdown-item" href="{{route('detailUser',[$user->id_NguoiDung])}}"><i class="me-50" data-feather="user"></i>
                        Thông tin</a>                   
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="{{route('dang-xuat')}}"><i class="me-50" data-feather="power"></i>
                        Đăng xuất</a>
                </div>
            </li>
        </ul>
    </div>
</nav>

<ul class="main-search-list-defaultlist d-none">
    <!-- Content of search list -->
</ul>

<ul class="main-search-list-defaultlist-other-list d-none">
    <!-- Content of other search list -->
</ul>