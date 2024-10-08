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
                                    <th>Mã Vị Trí</th>
                                    <th>Tên Vị Trí</th>
                                    <th>Tổng Sức Chứa</th>
                                    <th>Khả Dụng</th>
                                    <th>Ngăn</th>
                                    <th>Ngày Tạo</th>
                                    <th>Ngày Sửa</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($bookLocation as $data)
                                <tr>
                                    <td>{{ $data->id_ViTri }}</td>
                                    <td>{{ $data->maViTri }}</td>
                                    <td>{{ $data->tenViTri }}</td>
                                    <td>{{ $data->sucChua }}</td>
                                    <td>{{ $data->viTriDaSuDung }}/{{ $data->sucChua }}</td>
                                    <td>{{ $data->tenNgan }}</td>
                                    <td>{{ $data->ngayTaoViTri }}</td>
                                    <td>
                                        {{ $data->ngaySuaViTri == $data -> ngayTaoViTri ? 'Chưa sửa' : $data -> ngaySuaViTri }}
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
                                            data-bs-target="#modals-edit" data-id="{{ $data->id_ViTri }}"
                                            data-ten="{{ $data->tenViTri }}" data-sucChua="{{ $data->sucChua }}" data-id-ngan="{{ $data -> id_Ngan }}" data-ten-ngan="{{ $data->tenNgan }}">
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
                <form class="add-new-record modal-content pt-0" action="{{ route('AddBookLocation') }}" method="post">
                    @csrf
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">×</button>
                    <div class="modal-header mb-1">
                        <h5 class="modal-title" id="exampleModalLabel">Thêm vị trí</h5>
                    </div>
                    <div class="modal-body flex-grow-1">
                        <div class="mb-1">
                            <label class="form-label" for="tenViTri">Tên vị trí</label>
                            <input type="text" class="form-control" id="tenViTri" name="tenViTri"
                                placeholder="Nhập tên vị trí">
                            @if($errors->has('tenViTri'))
                            <span class="error-message text-danger">*
                                {{$errors->first('tenViTri')}}</span>
                            @endif
                        </div>
                        <div class="mb-1">
                            <label class="form-label" for="sucChua">Sức chứa</label>
                            <div class="input-group disabled-touchspin">
                                <input type="number" class="touchspin" id="sucChua" name="sucChua" value="20" />
                            </div>
                            @if($errors->has('sucChua'))
                            <span class="error-message text-danger">*
                                {{$errors->first('sucChua')}}</span>
                            @endif
                        </div>
                        <div class="mb-1">
                            <label class="form-label" for="id_Ngan">Chọn ngăn</label>
                            <select class="select2 form-select" id="id_Ngan" name="id_Ngan">
                                @foreach ($bookCase as $data)
                                <option value="{{$data -> id_Ngan}}">{{$data -> tenNgan}}</option>
                                @endforeach
                            </select>
                            @if($errors->has('id_Ngan'))
                            <span class="error-message text-danger">*
                                {{$errors->first('id_Ngan')}}</span>
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
                <form class="add-new-record modal-content pt-0" action="{{ route('editBookLocation') }}" method="post">
                    @csrf
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">×</button>
                    <div class="modal-header mb-1">
                        <h5 class="modal-title" id="exampleModalLabel">Sửa Vị Trí </h5>
                    </div>
                    <div class="modal-body flex-grow-1">
                        <input type="hidden" id="edit-id" name="id_ViTri">
                        <input type="hidden" id="edit-id-ngan" name="id_Ngan">

                        <div class="mb-1">
                            <label class="form-label" for="tenViTri1">Tên Vị Trí </label>
                            <input type="text" class="form-control" id="tenViTri1" name="tenViTri1">
                            @if($errors->has('tenViTri1'))
                            <span class="error-message text-danger">*
                                {{$errors->first('tenViTri1')}}</span>
                            @endif
                        </div>

                        <div class="mb-1">
                            <label class="form-label" for="sucChua1">Sức chứa</label>
                            <div class="input-group disabled-touchspin">
                                <input type="number" class="touchspin" id="sucChua1" name="sucChua1" />
                            </div>
                            @if($errors->has('sucChua1'))
                            <span class="error-message text-danger">*
                                {{$errors->first('sucChua1')}}</span>
                            @endif
                        </div>

                        <div class="mb-1">
                            <label class="form-label" for="id_Ngan1">Chọn ngăn</label>
                            <select class="select2 form-select" id="id_Ngan1" name="id_Ngan1">
                                <option value="">Chọn ngăn</option>
                                @foreach ($bookCase as $data)
                                <option value="{{$data -> id_Ngan}}">{{$data -> tenNgan}}</option>
                                @endforeach
                            </select>
                            @if($errors->has('id_Ngan1'))
                            <span class="error-message text-danger">*
                                {{$errors->first('id_Ngan1')}}</span>
                            @endif
                        </div>

                        <button type="submit" class="btn btn-primary data-submit me-1">Cập nhật</button>
                        <button type="reset" class="btn btn-outline-secondary" data-bs-dismiss="modal">Hủy</button>
                    </div>
                    <span id="course-name"></span>
                </form>
            </div>
        </div>
    </section>
</div>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Xử lý sự kiện click cho các nút edit
        document.querySelectorAll('.item-edit').forEach(function(element) {
            element.addEventListener('click', function() {
                var id_ViTri = this.getAttribute('data-id');
                var id_Ngan = this.getAttribute('data-id-ngan');
                var tenViTri1 = this.getAttribute('data-ten');
                var sucChua1 = this.getAttribute('data-sucChua');
                var tenNgan1 = this.getAttribute('data-ten-ngan');

                document.getElementById('edit-id').value = id_ViTri;
                document.getElementById('edit-id-ngan').value = id_Ngan;
                document.getElementById('tenViTri1').value = tenViTri1;
                document.getElementById('sucChua1').value = sucChua1;

                var selectElement = document.getElementById('id_Ngan1');
                var options = selectElement.querySelectorAll('option');
                console.log('Options:', options);
                console.log('ID Ngan:', id_Ngan);

                options.forEach(function(option) {
                    if (option.value == id_Ngan) {
                        console.log('Setting value:', id_Ngan);
                        selectElement.value = id_Ngan;
                    }
                });
            });
        });
    });
</script>
<script src="app-assets/js/scripts/formatInputLocation.js"></script>
@endsection