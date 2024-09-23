@extends('admin.main')
@section('layouts')
<div class="content-body">
    <!-- Basic table -->
    <section id="basic-datatable">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper dt-bootstrap5 no-footer">
                        <div class="card-header border-bottom p-1">
                            <div class="head-label">

                            </div>
                            <div class="dt-action-buttons text-end">
                                <div class="dt-buttons d-inline-flex">
                                    <button
                                        class="dt-button buttons-collection btn btn-outline-secondary dropdown-toggle me-2"
                                        tabindex="0" aria-controls="DataTables_Table_0" type="button"
                                        aria-haspopup="true">
                                        <span>
                                            <i data-feather='upload' class="me-1"></i>Export
                                        </span>
                                    </button>
                                    <button class="dt-button create-new btn btn-primary" tabindex="0"
                                        aria-controls="DataTables_Table_0" type="button">
                                        <span>
                                            <i data-feather='plus' class="me-1"></i><a class="text-light" href="{{route('formAddBook')}}">Thêm</a>
                                        </span>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <table class="datatables-basic table-striped table table-hover" id="table">
                            <thead >
                                <tr>
                                    <th>Mã Sách</th>
                                    <th>Tên Sách</th>
                                    <th>Hình ảnh</th>
                                    <th>Tên tác giả</th>
                                    <th>Số lượng</th>
                                    <th>Giá nhập</th>
                                    <th>Vị trí</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($books as $data)
                                <tr>
                                    <td>{{ $data->maSach}}</td>
                                    <td><a href="{{route('detailBook',[$data -> id_Sach])}}">{{ $data->tenSach }}</a></td>
                                    <td><img src="{{ $data->duongDan}}" width="60"></td>
                                    <td>{{ $data->tenTacGia }}</td>
                                    <td>{{ $data->soLuongCoSan }}/{{ $data->soLuongHienCo }}</td>
                                    <td>{{ $data->formattedGiaTien  }}₫</td>
                                    <td>{{ $data->tenViTri }}</td>
                                    <td>
                                        <div class="d-inline-flex">
                                            <a class="pe-1 dropdown-toggle hide-arrow text-primary"
                                                data-bs-toggle="dropdown">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14"
                                                    viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                    stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                    class="feather feather-more-vertical">
                                                    <circle cx="12" cy="12" r="1"></circle>
                                                    <circle cx="12" cy="5" r="1"></circle>
                                                    <circle cx="12" cy="19" r="1"></circle>
                                                </svg>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-end">
                                                <a href="{{route('detailBook',[$data -> id_Sach])}}" class="dropdown-item">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14"
                                                        viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                        stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                        class="feather feather-eye me-1">
                                                        <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z">
                                                        </path>
                                                        <circle cx="12" cy="12" r="3"></circle>
                                                    </svg>
                                                    Chi tiết
                                                </a>
                                            </div>
                                        </div>
                                        <a href="{{route('formEditBook',[$data -> id_Sach])}}" class="item-edit">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14"
                                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                                stroke-linecap="round" stroke-linejoin="round"
                                                class="feather feather-edit">
                                                <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7">
                                                </path>
                                                <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z">
                                                </path>
                                            </svg>
                                        </a>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

@endsection