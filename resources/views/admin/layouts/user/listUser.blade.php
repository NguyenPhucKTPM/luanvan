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
                                <div class="dt-buttons d-inline-flex"> <button
                                        class="dt-button buttons-collection btn btn-outline-secondary dropdown-toggle me-2"
                                        tabindex="0" aria-controls="DataTables_Table_0" type="button"
                                        aria-haspopup="true"><span><svg xmlns="http://www.w3.org/2000/svg" width="24"
                                                height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                class="feather feather-share font-small-4 me-50">
                                                <path d="M4 12v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2v-8"></path>
                                                <polyline points="16 6 12 2 8 6"></polyline>
                                                <line x1="12" y1="2" x2="12" y2="15"></line>
                                            </svg>Export</span></button> <button
                                        class="dt-button create-new btn btn-primary" tabindex="0"
                                        aria-controls="DataTables_Table_0" type="button" data-bs-toggle="modal"
                                        data-bs-target="#modals-slide-in"><span><svg xmlns="http://www.w3.org/2000/svg"
                                                width="24" height="24" viewBox="0 0 24 24" fill="none"
                                                stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                                stroke-linejoin="round" class="feather feather-plus me-50 font-small-4">
                                                <line x1="12" y1="5" x2="12" y2="19"></line>
                                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                            </svg>Thêm</span></button> </div>
                            </div>
                        </div>
                        <div class="d-flex justify-content-between align-items-center mx-0 row">
                            <div class="col-sm-12 col-md-6">
                                <div class="dataTables_length d-flex align-items-center "
                                    id="DataTables_Table_0_length"><label
                                        class="d-flex justify-content-start align-items-center">Show
                                        <select name="DataTables_Table_0_length" aria-controls="DataTables_Table_0"
                                            class="form-select">
                                            <option value="7">7</option>
                                            <option value="10">10</option>
                                            <option value="25">25</option>
                                            <option value="50">50</option>
                                            <option value="75">75</option>
                                            <option value="100">100</option>
                                        </select> entries</label></div>
                            </div>
                            <div class="col-sm-12 col-md-6">
                                <div id="DataTables_Table_0_filter"
                                    class="dataTables_filter d-flex align-items-center  justify-content-end">
                                    <label class="me-2">Tìm kiếm:</label>
                                    <input type="search" class="form-control" placeholder=""
                                        aria-controls="DataTables_Table_0" style="width:250px;">
                                </div>
                            </div>
                        </div>

                        <table class="datatables-basic table dataTable no-footer dtr-column" id="DataTables_Table_0"
                            role="grid" aria-describedby="DataTables_Table_0_info" style="width: 1443px;">
                            <thead>
                                <tr role="row">
                                    <th class="control sorting_disabled" rowspan="1" colspan="1"
                                        style="width: 50px; display: none;" aria-label=""></th>
                                    <th class="sorting_disabled dt-checkboxes-cell dt-checkboxes-select-all" rowspan="1"
                                        colspan="1" style="width: 50px;" data-col="1" aria-label="">
                                        <div class="form-check"> <input class="form-check-input" type="checkbox"
                                                value="" id="checkboxSelectAll"><label class="form-check-label"
                                                for="checkboxSelectAll"></label></div>
                                    </th>
                                    <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1"
                                        colspan="1" style="width: 148px;"
                                        aria-label="Name: activate to sort column ascending">Name</th>
                                    <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1"
                                        colspan="1" style="width: 152px;"
                                        aria-label="Email: activate to sort column ascending">Email</th>
                                    <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1"
                                        colspan="1" style="width: 138px;"
                                        aria-label="Date: activate to sort column ascending">Date</th>
                                    <th class="sorting sorting_asc" tabindex="0" aria-controls="DataTables_Table_0"
                                        rowspan="1" colspan="1" style="width: 175px;"
                                        aria-label="Salary: activate to sort column descending" aria-sort="ascending">
                                        Salary</th>
                                    <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1"
                                        colspan="1" style="width: 169px;"
                                        aria-label="Status: activate to sort column ascending">Status</th>
                                    <th class="sorting_disabled" rowspan="1" colspan="1" style="width: 180px;"
                                        aria-label="Actions">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="odd">
                                    <td class=" control" tabindex="0" style="display: none;"></td>
                                    <td class=" dt-checkboxes-cell">
                                        <div class="form-check"> <input class="form-check-input dt-checkboxes"
                                                type="checkbox" value="" id="checkbox101"><label
                                                class="form-check-label" for="checkbox101"></label></div>
                                    </td>
                                    <td>
                                        <div class="d-flex justify-content-left align-items-center">
                                            <div class="avatar  me-1"><span class="avatar-content">S</span></div>
                                            <div class="d-flex flex-column"><span
                                                    class="emp_name text-truncate fw-bold">sedff</span><small
                                                    class="emp_post text-truncate text-muted">dsfdsf</small></div>
                                        </div>
                                    </td>
                                    <td class="sorting_1">dsfsd</td>
                                    <td>07/02/2024</td>
                                    <td>$df</td>
                                    <td><span class="badge rounded-pill  badge-light-info">Applied</span></td>
                                    <td>
                                        <div class="d-inline-flex"><a
                                                class="pe-1 dropdown-toggle hide-arrow text-primary"
                                                data-bs-toggle="dropdown"><svg xmlns="http://www.w3.org/2000/svg"
                                                    width="24" height="24" viewBox="0 0 24 24" fill="none"
                                                    stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                                    stroke-linejoin="round"
                                                    class="feather feather-more-vertical font-small-4">
                                                    <circle cx="12" cy="12" r="1"></circle>
                                                    <circle cx="12" cy="5" r="1"></circle>
                                                    <circle cx="12" cy="19" r="1"></circle>
                                                </svg></a>
                                            <div class="dropdown-menu dropdown-menu-end"><a href="javascript:;"
                                                    class="dropdown-item"><svg xmlns="http://www.w3.org/2000/svg"
                                                        width="24" height="24" viewBox="0 0 24 24" fill="none"
                                                        stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                                        stroke-linejoin="round"
                                                        class="feather feather-file-text font-small-4 me-50">
                                                        <path
                                                            d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z">
                                                        </path>
                                                        <polyline points="14 2 14 8 20 8"></polyline>
                                                        <line x1="16" y1="13" x2="8" y2="13"></line>
                                                        <line x1="16" y1="17" x2="8" y2="17"></line>
                                                        <polyline points="10 9 9 9 8 9"></polyline>
                                                    </svg>Details</a><a href="javascript:;" class="dropdown-item"><svg
                                                        xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                        viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                        stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                        class="feather feather-archive font-small-4 me-50">
                                                        <polyline points="21 8 21 21 3 21 3 8"></polyline>
                                                        <rect x="1" y="3" width="22" height="5"></rect>
                                                        <line x1="10" y1="12" x2="14" y2="12"></line>
                                                    </svg>Archive</a><a href="javascript:;"
                                                    class="dropdown-item delete-record"><svg
                                                        xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                        viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                        stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                        class="feather feather-trash-2 font-small-4 me-50">
                                                        <polyline points="3 6 5 6 21 6"></polyline>
                                                        <path
                                                            d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
                                                        </path>
                                                        <line x1="10" y1="11" x2="10" y2="17"></line>
                                                        <line x1="14" y1="11" x2="14" y2="17"></line>
                                                    </svg>Delete</a></div>
                                        </div><a href="javascript:;" class="item-edit"><svg
                                                xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                                stroke-linecap="round" stroke-linejoin="round"
                                                class="feather feather-edit font-small-4">
                                                <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7">
                                                </path>
                                                <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z">
                                                </path>
                                            </svg></a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        <div class="d-flex justify-content-between mx-0 row">
                            <div class="col-sm-12 col-md-6">
                                <div class="dataTables_info" id="DataTables_Table_0_info" role="status"
                                    aria-live="polite">Showing 1 to 1 of 1 entries</div>
                            </div>
                            <div class="col-sm-12 col-md-6">
                                <div class="dataTables_paginate paging_simple_numbers  "
                                    id="DataTables_Table_0_paginate">
                                    <ul class="pagination d-flex justify-content-end">
                                        <li class="paginate_button page-item previous disabled"
                                            id="DataTables_Table_0_previous"><a href="#"
                                                aria-controls="DataTables_Table_0" data-dt-idx="0" tabindex="0"
                                                class="page-link">&nbsp;</a></li>
                                        <li class="paginate_button page-item active"><a href="#"
                                                aria-controls="DataTables_Table_0" data-dt-idx="1" tabindex="0"
                                                class="page-link">1</a></li>
                                        <li class="paginate_button page-item next disabled"
                                            id="DataTables_Table_0_next"><a href="#" aria-controls="DataTables_Table_0"
                                                data-dt-idx="2" tabindex="0" class="page-link">&nbsp;</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal to add new record -->
        <div class="modal modal-slide-in fade" id="modals-slide-in" style="display: none;" aria-hidden="true">
            <div class="modal-dialog sidebar-sm">
                <form class="add-new-record modal-content pt-0">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">×</button>
                    <div class="modal-header mb-1">
                        <h5 class="modal-title" id="exampleModalLabel">New Record</h5>
                    </div>
                    <div class="modal-body flex-grow-1">
                        <div class="mb-1">
                            <label class="form-label" for="basic-icon-default-fullname">Full Name</label>
                            <input type="text" class="form-control dt-full-name" id="basic-icon-default-fullname"
                                placeholder="John Doe" aria-label="John Doe">
                        </div>
                        <div class="mb-1">
                            <label class="form-label" for="basic-icon-default-post">Post</label>
                            <input type="text" id="basic-icon-default-post" class="form-control dt-post"
                                placeholder="Web Developer" aria-label="Web Developer">
                        </div>
                        <div class="mb-1">
                            <label class="form-label" for="basic-icon-default-email">Email</label>
                            <input type="text" id="basic-icon-default-email" class="form-control dt-email"
                                placeholder="john.doe@example.com" aria-label="john.doe@example.com">
                            <small class="form-text"> You can use letters, numbers &amp; periods </small>
                        </div>
                        <div class="mb-1">
                            <label class="form-label" for="fp-default">Joining Date</label>
                            <input type="text" id="fp-default" name="ngaySinh"
                                class="form-control flatpickr-basic flatpickr-input active" placeholder="YYYY-MM-DD"
                                readonly="readonly">
                        </div>
                        <div class="mb-4">
                            <label class="form-label" for="basic-icon-default-salary">Salary</label>
                            <input type="text" id="basic-icon-default-salary" class="form-control dt-salary"
                                placeholder="$12000" aria-label="$12000">
                        </div>
                        <button type="button"
                            class="btn btn-primary data-submit me-1 waves-effect waves-float waves-light">Submit</button>
                        <button type="reset" class="btn btn-outline-secondary waves-effect"
                            data-bs-dismiss="modal">Cancel</button>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!--/ Basic table -->


</div>
@endsection