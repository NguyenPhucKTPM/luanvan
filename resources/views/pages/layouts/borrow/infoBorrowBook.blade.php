@extends('pages.main')
@section('layouts')
<style>
    .hover-underline:hover {
        text-decoration: underline !important;
    }

    @keyframes spin {
        to {
            transform: rotate(360deg);
        }
    }

    @keyframes ping {

        75%,
        100% {
            transform: scale(2);
            opacity: 0;
        }
    }

    @keyframes pulse {
        50% {
            opacity: .5;
        }
    }

    @keyframes bounce {

        0%,
        100% {
            transform: translateY(-25%);
            animation-timing-function: cubic-bezier(0.8, 0, 1, 1);
        }

        50% {
            transform: none;
            animation-timing-function: cubic-bezier(0, 0, 0.2, 1);
        }
    }

    @media (max-width: 600px) {
        .sm-px-24 {
            padding-left: 24px !important;
            padding-right: 24px !important;
        }

        .sm-py-32 {
            padding-top: 32px !important;
            padding-bottom: 32px !important;
        }

        .sm-w-full {
            width: 100% !important;
        }
    }
</style>
<section class="ftco-section">
    <div class="container d-flex justify-content-center">
        <table class="sm-w-full " style="font-family: 'Montserrat',Arial,sans-serif; width: 600px; border: 1px solid #0e4582; box-shadow: 0 15px 30px rgba(14, 69, 130, 0.3);" width="600" cellpadding="0" cellspacing="0" role="presentation">
            <tr>
                <td class="sm-py-32 sm-px-24" style="font-family: Montserrat, -apple-system, 'Segoe UI', sans-serif; padding: 48px; text-align: center;" align="center">
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="d-flex justify-content-start">
                            <img src="{{asset('pages/images/logo_ctut1.png')}}" width="220" alt="Logo" style="border: 0; max-width: 100%; line-height: 100%; vertical-align: middle;">
                        </div>
                        <div class="d-flex justify-content-end">
                            <img src="data:image/png;base64,{{ $qrCodeBase64 }}" width="100" alt="QR Code">
                        </div>
                    </div>
                </td>
                <!-- <td class="sm-py-32 sm-px-24" style="font-family: Montserrat, -apple-system, 'Segoe UI', sans-serif; padding: 48px; text-align: left;" align="left">
                    <div class="qr-code d-flex justify-content-end">
                    </div>
                </td> -->
            </tr>
            <tr>
                <td align="center" class="sm-px-24" style="font-family: 'Montserrat',Arial,sans-serif;">
                    <table style="font-family: 'Montserrat',Arial,sans-serif; width: 100%;" width="100%" cellpadding="0" cellspacing="0" role="presentation">
                        <tr>
                            <td class="sm-px-24" style="--bg-opacity: 1; background-color: #ffffff; background-color: rgba(255, 255, 255, var(--bg-opacity)); border-radius: 4px; font-family: Montserrat, -apple-system, 'Segoe UI', sans-serif; font-size: 14px; line-height: 24px; padding: 48px; text-align: left; --text-opacity: 1; color: #626262; color: rgba(98, 98, 98, var(--text-opacity));" bgcolor="rgba(255, 255, 255, var(--bg-opacity))" align="left">
                                <p style="font-weight: 600; font-size: 18px; margin-bottom: 0;">Cảm ơn !</p>
                                <p style="font-weight: 700; font-size: 20px; margin-top: 0; --text-opacity: 1; color: #ff5850; color: rgba(255, 88, 80, var(--text-opacity));">{{$getBorrowAdded -> tenNguoiDung}}</p>
                                <p style="margin: 0 0 24px;">
                                    Phiếu đăng kí mượn sách của bạn đã được gửi. Chúng tôi sẽ phản hồi sớm nhất đến bạn.
                                </p>
                                <table style="font-family: 'Montserrat',Arial,sans-serif; width: 100%;" width="100%" cellpadding="0" cellspacing="0" role="presentation">
                                    <tr>
                                        <td style="font-family: 'Montserrat',Arial,sans-serif; font-size: 14px;">
                                            <table style="font-family: 'Montserrat',Arial,sans-serif; width: 100%;" width="100%" cellpadding="0" cellspacing="0" role="presentation">
                                                <tr>
                                                    <td style="font-family: 'Montserrat',Arial,sans-serif; font-size: 14px;">
                                                        <strong>Mã phiếu:</strong> {{$getBorrowAdded -> maPhieuMuon}}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="font-family: 'Montserrat',Arial,sans-serif; font-size: 14px;">
                                                        <strong>Hình thức mượn:</strong> {{$getBorrowAdded -> hinhThucMuon == 'Mượn từ xa' ? $getBorrowAdded -> hinhThucMuon .' (đã cọc '. number_format($getBorrowAdded -> tienCoc, 0, ',', '.').')' : $getBorrowAdded -> hinhThucMuon }}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="font-family: 'Montserrat',Arial,sans-serif; font-size: 14px;">
                                                        <strong>Trạng thái:</strong> {{$statusBorrow}}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="font-family: 'Montserrat',Arial,sans-serif; font-size: 14px;">
                                                        <strong>Ngày mượn:</strong> {{ \Carbon\Carbon::parse($getBorrowAdded->ngayMuon)->format('d/m/Y') }}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="font-family: 'Montserrat',Arial,sans-serif; font-size: 14px;">
                                                        <strong>Ngày trả dự kiến:</strong> {{ \Carbon\Carbon::parse($getBorrowAdded->ngayTraDuKien)->format('d/m/Y') }}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="font-family: 'Montserrat',Arial,sans-serif; font-size: 14px;">
                                                        <strong>Ghi chú:</strong> {{$getBorrowAdded -> ghiChuPhieuMuon == null ? 'Không có' : $getBorrowAdded -> ghiChuPhieuMuon}}
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                                <table class="mt-3" style="font-family: 'Montserrat',Arial,sans-serif; width: 100%;" width="100%" cellpadding="0" cellspacing="0" role="presentation">
                                    <tr>
                                        <td colspan="2" style="font-family: 'Montserrat',Arial,sans-serif;">
                                            <table style="font-family: 'Montserrat',Arial,sans-serif; width: 100%;" width="100%" cellpadding="0" cellspacing="0" role="presentation">
                                                <tr>
                                                    <th align="left" style="padding-bottom: 8px;">
                                                        <p>Tên sách</p>
                                                    </th>
                                                    <th align="center" style="padding-bottom: 8px;">
                                                        <p>Số lượng</p>
                                                    </th>
                                                    <th style="padding-bottom: 8px; text-align: right">
                                                        <p>Giá</p>
                                                    </th>
                                                </tr>
                                                @php $tong = 0 @endphp
                                                @foreach ( $getDetailBorrowAdded as $data )
                                                @php
                                                $tong += $data -> giaTien * $data -> soLuongSachMuon;
                                                @endphp
                                                <tr>
                                                    <td style="font-family: 'Montserrat',Arial,sans-serif; font-size: 14px; padding-top: 10px; padding-bottom: 10px; width: 80%;" width="80%">
                                                        {{$data -> tenSach}}
                                                    </td>
                                                    <td align="center" style="font-family: 'Montserrat',Arial,sans-serif; font-size: 14px; text-align: center; width: 20%;" width="20%">x {{$data -> soLuongSachMuon}}</td>
                                                    <td align="right" style="font-family: 'Montserrat',Arial,sans-serif; font-size: 14px; text-align: right; width: 20%;" width="20%"> {{ number_format($data->giaTien * $data -> soLuongSachMuon , 0, ',', '.') }}₫</td>
                                                </tr>
                                                @endforeach
                                                @if($getBorrowAdded -> hinhThucMuon == 'Mượn từ xa')
                                                <tr>
                                                    <td style="font-family: 'Montserrat',Arial,sans-serif; font-size: 14px; padding-top: 10px; padding-bottom: 10px; width: 80%;" width="80%">

                                                    </td>
                                                    <td align="center" style="font-family: 'Montserrat',Arial,sans-serif; font-size: 14px; text-align: center; width: 20%;" width="20%">Ship</td>
                                                    <td align="right" style="font-family: 'Montserrat',Arial,sans-serif; font-size: 14px; text-align: right; width: 20%;" width="20%"> 40.000₫</td>
                                                </tr>
                                                <tr>
                                                    <td style="font-family: 'Montserrat',Arial,sans-serif; font-size: 14px; padding-top: 10px; padding-bottom: 10px; width: 80%;" width="80%">
                                                    </td>
                                                    <td align="center" style="font-family: 'Montserrat',Arial,sans-serif; font-size: 14px; text-align: center; width: 20%;" width="20%"><strong>Tổng</strong></td>

                                                    <td align="right" style="font-family: 'Montserrat',Arial,sans-serif; font-size: 14px; text-align: right; width: 20%;" width="20%"><strong>{{number_format($tong + 40000, 0, ',', '.')}}₫</strong></td>
                                                </tr>
                                                @endif
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                                <table align="center" style="font-family: 'Montserrat',Arial,sans-serif; margin-left: auto; margin-right: auto; text-align: center; width: 100%;" width="100%" cellpadding="0" cellspacing="0" role="presentation">
                                    <tr>
                                        <td align="right" style="font-family: 'Montserrat',Arial,sans-serif;">
                                            <table style="font-family: 'Montserrat',Arial,sans-serif; margin-top: 24px; margin-bottom: 24px;" cellpadding="0" cellspacing="0" role="presentation">
                                                <tr>
                                                    <td align="right" style="mso-padding-alt: 16px 24px; --bg-opacity: 1; background-color: #7367f0; background-color:#0e4582; border-radius: 4px; font-family: Montserrat, -apple-system, 'Segoe UI', sans-serif;" bgcolor="#0e4582">
                                                        <a href="{{route('home')}}" style="display: block; font-weight: 600; font-size: 14px; line-height: 100%; padding: 16px 24px; --text-opacity: 1; color: #ffffff; color: rgba(255, 255, 255, var(--text-opacity)); text-decoration: none;">Trang chủ &rarr;</a>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>

                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="font-family: 'Montserrat',Arial,sans-serif; height: 20px;" height="20"></td>
            </tr>
            <tr>
                <td style="font-family: 'Montserrat',Arial,sans-serif; height: 16px;" height="16"></td>
            </tr>
        </table>
        </td>
        </tr>
        </table>
    </div>

</section>
@endsection