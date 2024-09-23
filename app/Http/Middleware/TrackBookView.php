<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class TrackBookView
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle($request, Closure $next)
    {
        if ($request->user()) {
            $bookId = $request->route('id'); // Lấy id sách từ route

            // Chỉ thực hiện khi có id của sách và id là số
            if ($bookId && is_numeric($bookId)) {
                // Chuyển đổi $bookId thành số nguyên
                $bookId = intval($bookId);

                // Lấy danh sách các sách đã xem từ cache (nếu có)
                $views = cache()->get("user_{$request->user()->id_NguoiDung}_book_views", []);

                // Lọc mảng $views để chỉ giữ lại các phần tử là số
                $views = array_filter($views, 'is_numeric');
                $views = array_map('intval', $views);

                // Nếu sách đã có trong danh sách đã xem
                if (($key = array_search($bookId, $views)) !== false) {
                    // Loại bỏ sách khỏi vị trí cũ
                    unset($views[$key]);
                }

                array_unshift($views, $bookId);

                $views = array_slice($views, 0, 20);

                cache()->put("user_{$request->user()->id_NguoiDung}_book_views", $views, 60 * 60 * 10);
            }
        }
        return $next($request);
    }
}
