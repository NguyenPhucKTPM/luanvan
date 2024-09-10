@extends('pages.main')
@section('layouts')
<section class="ftco-section bg-light">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-lg-10 order-md-last">
				<div class="row">
					@foreach ( $getBook as $data )
					<div class="col-sm-12 col-md-12 col-lg-4 ftco-animate d-flex">
						<div class="product d-flex flex-column">
							<a href="{{route('pageDetailBook',$data->id_Sach)}}" class="img-prod"><img class="img-fluid" src="{{$data->duongDan}}" alt="Colorlib Template">
								<div class="overlay"></div>
							</a>
							<div class="text py-3 pb-4 px-3">
								<div class="d-flex">
									<div class="cat">
										<span>{{$data -> tenTheLoai}}</span>
									</div>
									<div class="rating">
										<p class="text-right mb-0">
											<a href="#" style="color:#f1b609"><span class="ion-ios-star-outline"></span></a>
											<a href="#" style="color:#f1b609"><span class="ion-ios-star-outline"></span></a>
											<a href="#" style="color:#f1b609"><span class="ion-ios-star-outline"></span></a>
											<a href="#" style="color:#f1b609"><span class="ion-ios-star-outline"></span></a>
											<a href="#" style="color:#f1b609"><span class="ion-ios-star-outline"></span></a>
										</p>
									</div>
								</div>
								<h3><a href="{{route('pageDetailBook',$data->id_Sach)}}">{{$data -> tenSach}} ({{$data->tenTacGia}})</a></h3>
								<div class="d-flex">
									<div class="pricing" style="width:50%">
										<p class="price text-success"><span>Số lượng: {{$data -> soLuongCoSan}}</span></p>
									</div>
									<div class="pricing" style="width:50%; text-align:right">
										<p class="price text-info"><span>Lượt mượn: {{$data -> luotMuon}}</span></p>
									</div>
								</div>
								<form id="cart-form-{{$data->id_Sach}}" action="{{route('addCart')}}" method="post">
								@csrf
								<input type="hidden" name="soLuong" value="1">
								<input type="hidden" name="id_Sach" value="{{ \Illuminate\Support\Facades\Crypt::encryptString($data->id_Sach) }}">
								<p class="bottom-area d-flex px-3">
									@if(isset($user))
									<a href="javascript:void(0)" class="add-to-cart text-center py-2 mr-1" onclick="document.getElementById('cart-form-{{$data->id_Sach}}').submit();">
										<span>Thêm vào giỏ
											<i class="ion-ios-add ml-1"></i>
										</span>
									</a>
									@endif
									<a href="{{route('pageDetailBook',$data->id_Sach)}}" class="buy-now text-center py-2">Chi tiết
										<span>
											<i class="far fa-eye ml-1"></i>
										</span>
									</a>
								</p>
								</form>
							</div>
						</div>
					</div>
					@endforeach
				</div>
				<div class="row mt-5">
					<div class="col text-center">
						<div class="block-27">
							<ul>
								@if ($getBook->onFirstPage())
								<li class="disabled"><a href="#">&lt;</a></li>
								@else
								<li><a href="{{ $getBook->appends(request()->all())->previousPageUrl() }}">&lt;</a></li>
								@endif

								@for ($i = 1; $i <= $getBook->lastPage(); $i++)
									@if ($i == 1 || $i == $getBook->lastPage() || ($i >= $getBook->currentPage() - 2 && $i <= $getBook->currentPage() + 2))
										<li class="{{ $getBook->currentPage() == $i ? 'active' : '' }}">
											<a href="{{ $getBook->appends(request()->all())->url($i) }}">{{ $i }}</a>
										</li>
										@elseif ($i == $getBook->currentPage() - 3 || $i == $getBook->currentPage() + 3)
										<li class="disabled"><span>...</span></li>
										@endif
										@endfor

										@if ($getBook->hasMorePages())
										<li><a href="{{ $getBook->appends(request()->all())->nextPageUrl() }}">&gt;</a></li>
										@else
										<li class="disabled"><a href="#">&gt;</a></li>
										@endif
							</ul>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-4 col-lg-2">
				<div class="sidebar">
					<div class="sidebar-box-2">
						<h2 class="heading">Lọc theo: </h2>
						<div class="fancy-collapse-panel">
							<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
								<div class="panel panel-default">
									<div class="panel-heading" role="tab" id="headingOne">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Ngôn ngữ
											</a>
										</h4>
									</div>
									<div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
										<div class="panel-body">
											<ul>
												@foreach ($getAllLanguage as $data)
												<li><a href="?category={{ request('category') }}&ngonngu={{ $data->id_NgonNgu }}">{{$data -> tenNgonNgu}}</a></li>
												@endforeach
											</ul>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading" role="tab" id="headingTwo">
										<h4 class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">Nhà xuất bản
											</a>
										</h4>
									</div>
									<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
										<div class="panel-body">
											<ul>
												@foreach ($getAllPublishers as $data)
												<li><a href="?category={{ request('category') }}&nxb={{ $data->id_NhaXuatBan }}">{{$data -> tenNhaXuatBan}}</a></li>
												@endforeach
											</ul>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading" role="tab" id="headingThree">
										<h4 class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">Ngành học
											</a>
										</h4>
									</div>
									<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
										<div class="panel-body">
											<ul>
												@foreach ($getAllDiscipline as $data)
												<li><a href="?category={{ request('category') }}&nganhhoc={{ $data->id_NganhHoc }}">{{$data -> tenNganhHoc}}</a></li>
												@endforeach
											</ul>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</section>

<!-- <script>
    function submitForm(id_Sach) {
        // Cập nhật giá trị của input id_Sach trước khi submit form
        document.getElementById('hidden-id-Sach').value = id_Sach;
        document.getElementById('cart-form').submit();
    }
</script> -->
@endsection