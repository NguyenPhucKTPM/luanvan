$(document).ready(function() {
    var table = $('.datatables-basic').DataTable({
        language: {
            search: "Tìm kiếm:",
            paginate: {
                previous: "&nbsp",
                next: "&nbsp",
            }
        },
        order: [[0, 'desc']], // Sắp xếp theo cột ID Khóa Học nếu cần
    });
});
