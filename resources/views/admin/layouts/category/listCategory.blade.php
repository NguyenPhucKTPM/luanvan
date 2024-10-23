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
                        <table class="datatables-basic table-striped table table-hover" id="table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Mã Thể Loại</th>
                                    <th>Tên Thể Loại</th>
                                    <th>Ngày Tạo</th>
                                    <th>Ngày Sửa</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($categories as $data)
                                <tr>
                                    <td>{{ $data->id_TheLoai }}</td>
                                    <td>{{ $data->maTheLoai }}</td>
                                    <td>{{ $data->tenTheLoai }}</td>
                                    <td>{{ $data->ngayTaoTheLoai }}</td>
                                    <td>
                                        {{ $data->ngaySuaTheLoai == $data -> ngayTaoTheLoai ? 'Chưa sửa' : $data -> ngaySuaTheLoai }}
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
                                                
                                            </div>
                                        </div>
                                        <a href="javascript:;" class="item-edit" data-bs-toggle="modal"
                                            data-bs-target="#modals-edit" data-id="{{ $data->id_TheLoai }}"
                                            data-ten="{{ $data->tenTheLoai }}">
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
                <form class="add-new-record modal-content pt-0" action="{{ route('addCategory') }}" method="post">
                    @csrf
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">×</button>
                    <div class="modal-header mb-1">
                        <h5 class="modal-title" id="exampleModalLabel">Thêm Thể Loại</h5>
                    </div>
                    <div class="modal-body flex-grow-1">
                        <div class="mb-1">
                            <label class="form-label" for="tenTheLoai">Tên Thể Loại</label>
                            <input type="text" class="form-control" id="tenTheLoai" name="tenTheLoai"
                                placeholder="Nhập tên thể loại">
                            @if($errors->has('tenTheLoai'))
                            <span class="error-message text-danger">*
                                {{$errors->first('tenTheLoai')}}</span>
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
                <form class="add-new-record modal-content pt-0" action="{{ route('editCategory') }}" method="post">
                    @csrf
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">×</button>
                    <div class="modal-header mb-1">
                        <h5 class="modal-title" id="exampleModalLabel">Sửa Thể Loại </h5>
                    </div>
                    <div class="modal-body flex-grow-1">
                        <input type="hidden" id="edit-id" name="id_TheLoai">

                        <div class="mb-1">
                            <label class="form-label" for="tenTheLoai1">Tên Thể Loại </label>
                            <input type="text" class="form-control" id="tenTheLoai1" name="tenTheLoai1">
                        </div>
                        <button type="submit" class="btn btn-primary data-submit me-1">Cập nhật</button>
                        <button type="reset" class="btn btn-outline-secondary" data-bs-dismiss="modal">Hủy</button>
                    </div>
                </form>
            </div>
        </div>
    </section>

 
    <!--/ Basic table -->


</div>
<script>
document.addEventListener('DOMContentLoaded', function() {
    // Xử lý sự kiện click cho các nút edit
    document.querySelectorAll('.item-edit').forEach(function(element) {
        element.addEventListener('click', function() {
            var id_TheLoai = this.getAttribute('data-id');
            var tenTheLoai1 = this.getAttribute('data-ten');
            document.getElementById('edit-id').value = id_TheLoai;
            document.getElementById('tenTheLoai1').value = tenTheLoai1;
        });
    });
});
</script>
@endsection