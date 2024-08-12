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
                                        aria-controls="DataTables_Table_0" type="button" data-bs-toggle="modal"
                                        data-bs-target="#modals-slide-in">
                                        <span>
                                            <i data-feather='plus' class="me-1"></i>Thêm
                                        </span>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <table class="datatables-basic table table-hover" id="table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Mã Lớp Học</th>
                                    <th>Tên Lớp Học</th>
                                    <th>Ngày Tạo</th>
                                    <th>Ngày Sửa</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($class as $data)
                                <tr>
                                    <td>{{ $data->id_Lop }}</td>
                                    <td>{{ $data->maLop }}</td>
                                    <td>{{ $data->tenLop }}</td>
                                    <td>{{ $data->ngayTaoLop }}</td>
                                    <td>
                                        {{ $data->ngaySuaLop == $data -> ngayTaoLop ? 'Chưa sửa' : $data -> ngaySuaLop }}
                                    </td>
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
                                                <a href="#" class="dropdown-item">
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
                                                @if($data -> id_Lop != 1)
                                                <a href="javascript:;" class="dropdown-item delete-record text-danger"
                                                    data-bs-toggle="modal" data-bs-target="#modals-delete"
                                                    data-id="{{ $data->id_Lop }}"
                                                    data-ten="{{ $data->tenLop }}">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14"
                                                        viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                        stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                        class="feather feather-trash-2 me-1">
                                                        <polyline points="3 6 5 6 21 6"></polyline>
                                                        <path
                                                            d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
                                                        </path>
                                                        <line x1="10" y1="11" x2="10" y2="17"></line>
                                                        <line x1="14" y1="11" x2="14" y2="17"></line>
                                                    </svg>
                                                    Xóa
                                                </a>
                                                @endif
                                            </div>
                                        </div>
                                        <a href="javascript:;" class="item-edit" data-bs-toggle="modal"
                                            data-bs-target="#modals-edit" data-id="{{ $data->id_Lop }}"
                                            data-ten="{{ $data->tenLop }}">
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
        <!-- Modal to add new record -->
        <div class="modal modal-slide-in fade" id="modals-slide-in">
            <div class="modal-dialog sidebar-sm">
                <form class="add-new-record modal-content pt-0" action="{{ route('addClassRoom') }}" method="post">
                    @csrf
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">×</button>
                    <div class="modal-header mb-1">
                        <h5 class="modal-title" id="exampleModalLabel">Thêm lớp học</h5>
                    </div>
                    <div class="modal-body flex-grow-1">
                        <div class="mb-1">
                            <label class="form-label" for="tenLop">Tên lớp học</label>
                            <input type="text" class="form-control dt-full-name" id="tenLop" name="tenLop"
                                placeholder="Nhập tên lớp học">
                            @if($errors->has('tenLop'))
                            <span class="error-message text-danger">*
                                {{$errors->first('tenLop')}}</span>
                            @endif
                        </div>

                        <button type="submit" class="btn btn-primary data-submit me-1">Thêm</button>
                        <button type="reset" class="btn btn-outline-secondary" data-bs-dismiss="modal">Hủy</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Modal to edit -->
        <div class="modal modal-slide-in fade" id="modals-edit">
            <div class="modal-dialog sidebar-sm">
                <form class="add-new-record modal-content pt-0" action="{{ route('editClassRoom') }}" method="post">
                    @csrf
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">×</button>
                    <div class="modal-header mb-1">
                        <h5 class="modal-title" id="exampleModalLabel">Sửa lớp học</h5>
                    </div>
                    <div class="modal-body flex-grow-1">
                        <input type="hidden" id="edit-id" name="id_Lop">

                        <div class="mb-1">
                            <label class="form-label" for="tenLop1">Tên lớp học</label>
                            <input type="text" class="form-control" id="tenLop1" name="tenLop1">
                        </div>
                        <button type="submit" class="btn btn-primary data-submit me-1">Cập nhật</button>
                        <button type="reset" class="btn btn-outline-secondary" data-bs-dismiss="modal">Hủy</button>
                    </div>
                </form>
            </div>
        </div>
    </section>

    <!-- Modal Delete -->
    <div class="modal fade modal-danger text-start" id="modals-delete" tabindex="-1" aria-labelledby="myModalLabel120"
        style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="myModalLabel120">Bạn có chắc muốn xóa ?</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Bạn có chắc muốn xóa khóa học: <span id="course-name"></span>
                </div>
                <div class="modal-footer">
                    <form id="delete-form" method="POST" action="#">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-danger waves-effect waves-float waves-light">Đồng
                            ý</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--/ Basic table -->


</div>
<script>
document.addEventListener('DOMContentLoaded', function() {
    // Xử lý sự kiện click cho các nút edit
    document.querySelectorAll('.item-edit').forEach(function(element) {
        element.addEventListener('click', function() {
            var id_Lop = this.getAttribute('data-id');
            var tenLop1 = this.getAttribute('data-ten');
            document.getElementById('edit-id').value = id_Lop;
            document.getElementById('tenLop1').value = tenLop1;
        });
    });
    // Xử lý sự kiện khi modal delete được hiển thị
    var deleteModal = document.getElementById('modals-delete');
    var deleteForm = document.getElementById('delete-form');
    var nameSpan = document.getElementById('course-name');
    deleteModal.addEventListener('show.bs.modal', function(event) {
        var button = event.relatedTarget;
        var Id = button.getAttribute('data-id');
        var className = button.getAttribute('data-ten');

        nameSpan.textContent = className;

        deleteForm.action = '{{ route("deleteClassRoom", ":id") }}'.replace(':id', Id);
    });
});
</script>
@endsection