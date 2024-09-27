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

                                </div>
                            </div>
                        </div>
                        <table class="datatables-basic table-striped table table-hover" id="table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Tên Hoạt Động</th>
                                    <th>Thời gian</th>
                                    <th>Người Thao Tác</th>
                                    <th>Mã Sách</th>
                                    <th>Chi Tiết</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($diaries as $data)
                                <tr>
                                    <td>{{ $data->id_HoatDong  }}</td>
                                    <td>{{ $data->tenHoatDong }}</td>
                                    <td>{{ \Carbon\Carbon::parse($data->ngayTaoHoatDong)->format('d-m-Y H:i:s') }}</td>
                                    <td><a href="{{ route('detailUser',[$data -> id_NguoiDung]) }}">{{ $data->tenNguoiDung }}</a></td>
                                    <td>{{ $data->maSach }} </td>
                                    <td>
                                        <button type="button" class="btn btn-outline-primary btn-sm"
                                            data-bs-toggle="popover" data-bs-placement="bottom"
                                            data-bs-container="body" title="Chi tiết hoạt động"
                                            data-bs-content="{{$data -> chiTietHoatDong == null ? 'Không có' : $data -> chiTietHoatDong}}">
                                            Chi tiết hoạt động
                                        </button>
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