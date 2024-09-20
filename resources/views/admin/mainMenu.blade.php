<div class="main-menu menu-fixed menu-light menu-accordion menu-shadow" data-scroll-to-active="true" style="touch-action: none; user-select: none; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
    <div class="navbar-header">
        <ul class="nav navbar-nav flex-row">
            <li class="nav-item me-auto">
                <a class="navbar-brand" href="{{route('dashboard')}}">
                    <span class="brand-logo">
                        <img src="{{asset('pages/images/logo.png')}}" alt="logo">
                    </span>
                </a>
            </li>
            <li class="nav-item nav-toggle"><a class="nav-link modern-nav-toggle pe-0" data-bs-toggle="collapse"><i
                        class="d-block d-xl-none text-primary toggle-icon font-medium-4" data-feather="x"></i><i
                        class="d-none d-xl-block collapse-toggle-icon font-medium-4  text-primary" data-feather="disc"
                        data-ticon="disc"></i></a></li>
        </ul>
    </div>
    <div class="shadow-bottom"></div>
    <div class="main-menu-content">
        <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">
            <li class=" navigation-header"><span data-i18n="Apps &amp; Pages">Người dùng</span><i
                    data-feather="more-horizontal"></i>
            </li>
            <li class=" nav-item  {{ Route::currentRouteName() == 'listUser' ? 'active' : '' }}">
                <a class="d-flex align-items-center" href="{{route('listUser')}}">
                    <i data-feather="user"></i>
                    <span class="menu-title text-truncate" data-i18n="Email">Quản lí người
                        dùng
                    </span>
                </a>
            </li>
            <li class=" nav-item  {{ Route::currentRouteName() == 'listCourse' ? 'active' : '' }}">
                <a class="d-flex align-items-center" href="{{route('listCourse')}}">
                    <i data-feather="flag"></i>
                    <span class="menu-title text-truncate" data-i18n="Chat">Quản
                        lí khóa học
                    </span>
                </a>
            </li>
            <li class=" nav-item {{ Route::currentRouteName() == 'listFaculty' ? 'active' : '' }}">
                <a class="d-flex align-items-center" href="{{route('listFaculty')}}">
                    <i data-feather='layers'></i>
                    <span class="menu-title text-truncate" data-i18n="Todo">Quản
                        lí khoa
                    </span>
                </a>
            </li>
            <li class=" nav-item {{ Route::currentRouteName() == 'listClassRoom' ? 'active' : '' }}">
                <a class="d-flex align-items-center" href="{{route('listClassRoom')}}">
                    <i
                        data-feather="grid"></i>
                    <span class="menu-title text-truncate"
                        data-i18n="Calendar">Quản lí lớp học
                    </span>
                </a>
            </li>

            <li class=" navigation-header"><span data-i18n="User Interface">Thư viện</span><i
                    data-feather="more-horizontal"></i>
            </li>
            <!-- <li class=" nav-item {{ Route::currentRouteName() == 'listBook' ? 'active' : '' }}">
                <a class="d-flex align-items-center" href="{{route('listBook')}}">
                    <i data-feather='book-open'></i>
                    <span class="menu-title text-truncate"
                        data-i18n="Typography">Quản lí sách
                    </span>
                </a>
            </li> -->
            <li class=" nav-item"><a class="d-flex align-items-center" href="#"><i data-feather="book-open"></i><span
                        class="menu-title text-truncate" data-i18n="Form Elements">Quản lí sách</span></a>
                <ul class="menu-content">
                    <li class="{{ Route::currentRouteName() == 'listBook' ? 'active' : '' }}">
                        <a class="d-flex align-items-center" href="{{ route('listBook') }}">
                            <i data-feather="circle"></i>
                            <span
                                class="menu-item text-truncate" data-i18n="Input">Tất cả sách
                            </span>
                        </a>
                    </li>
                    <li class="{{ Route::currentRouteName() == 'formAddBook' ? 'active' : '' }}">
                        <a class="d-flex align-items-center" href="{{ route('formAddBook') }}">
                            <i data-feather="circle"></i>
                            <span class="menu-item text-truncate"
                                data-i18n="Input Groups">Thêm sách
                            </span>
                        </a>
                    </li>
                </ul>
            </li>
            <li class=" nav-item  {{ Route::currentRouteName() == 'listPublisher' ? 'active' : '' }}">
                <a class="d-flex align-items-center" href="{{route('listPublisher')}}">
                    <i data-feather='feather'></i>
                    <span class="menu-title text-truncate"
                        data-i18n="Feather">Quản lí nhà xuất bản
                    </span>
                </a>
            </li>
            <li class=" nav-item  {{ Route::currentRouteName() == 'listLanguage' ? 'active' : '' }}">
                <a class="d-flex align-items-center" href="{{route('listLanguage')}}">
                    <i data-feather='type'></i>
                    <span class="menu-title text-truncate"
                        data-i18n="Feather">Quản lí ngôn ngữ
                    </span>
                </a>
            </li>
            <li class=" nav-item  {{ Route::currentRouteName() == 'listCategory' ? 'active' : '' }}">
                <a class="d-flex align-items-center" href="{{route('listCategory')}}">
                    <i data-feather='tag'></i>
                    <span class="menu-title text-truncate"
                        data-i18n="Feather">Quản lí thể loại
                    </span>
                </a>
            </li>
            <li class=" nav-item  {{ Route::currentRouteName() == 'listDiscipline' ? 'active' : '' }}">
                <a class="d-flex align-items-center" href="{{route('listDiscipline')}}">
                    <i data-feather='hexagon'></i>
                    <span class="menu-title text-truncate"
                        data-i18n="Feather">Quản lí ngành học
                    </span>
                </a>
            </li>
            <li class=" nav-item"><a class="d-flex align-items-center" href="#"><i data-feather="codepen"></i><span
                        class="menu-title text-truncate" data-i18n="Form Elements">Quản lí kho để sách</span></a>
                <ul class="menu-content">
                    <li class="{{ Route::currentRouteName() == 'listBookCase' ? 'active' : '' }}">
                        <a class="d-flex align-items-center" href="{{ route('listBookCase') }}">
                            <i data-feather="circle"></i>
                            <span
                                class="menu-item text-truncate" data-i18n="Input">Ngăn để sách
                            </span>
                        </a>
                    </li>
                    <li class="{{ Route::currentRouteName() == 'listBookLocation' ? 'active' : '' }}">
                        <a class="d-flex align-items-center" href="{{ route('listBookLocation') }}">
                            <i data-feather="circle"></i>
                            <span class="menu-item text-truncate"
                                data-i18n="Input Groups">Vị trí để sách
                            </span>
                        </a>
                    </li>
                </ul>
            </li>
            <li class=" navigation-header"><span data-i18n="QLMT">Mượn trả sách</span><i data-feather="more-horizontal"></i>
            </li>
            <li class=" nav-item"><a class="d-flex align-items-center" href="#"><i data-feather="file-text"></i><span
                        class="menu-title text-truncate" data-i18n="Menu Levels">Phiếu mượn sách</span></a>
                <ul class="menu-content">
                    <li class="{{ Route::currentRouteName() == 'listBorrowPending' ? 'active' : '' }}">
                        <a class="d-flex align-items-center" href="{{route('listBorrowPending')}}">
                            <i data-feather="circle"></i>
                            <span class="menu-item text-truncate" data-i18n="Second Level">Đang chờ duyệt</span>
                        </a>
                    </li>
                    <li class="{{ Route::currentRouteName() == 'listBorrowApproved' ? 'active' : '' }}">
                        <a class="d-flex align-items-center" href="{{route('listBorrowApproved')}}">
                            <i data-feather="circle"></i>
                            <span class="menu-item text-truncate" data-i18n="Second Level">Đang đã duyệt</span>
                        </a>
                    </li>
                    <li class="{{ Route::currentRouteName() == 'listBorrowing' ? 'active' : '' }}">
                        <a class="d-flex align-items-center" href="{{route('listBorrowing')}}">
                            <i data-feather="circle"></i>
                            <span class="menu-item text-truncate" data-i18n="Second Level">Đang mượn</span>
                        </a>
                    </li>
                    <li class="{{ Route::currentRouteName() == 'listBorrowCancel' ? 'active' : '' }}">
                        <a class="d-flex align-items-center" href="{{route('listBorrowCancel')}}">
                            <i data-feather="circle"></i>
                            <span class="menu-item text-truncate" data-i18n="Second Level">Đang đã hủy</span>
                        </a>
                    </li>
                    <li class="{{ Route::currentRouteName() == 'listBorrowReturn' ? 'active' : '' }}">
                        <a class="d-flex align-items-center" href="{{route('listBorrowReturn')}}">
                            <i data-feather="circle"></i>
                            <span class="menu-item text-truncate" data-i18n="Second Level">Đã trả sách</span>
                        </a>
                    </li>
                </ul>
            </li>
          
        </ul>
    </div>
</div>