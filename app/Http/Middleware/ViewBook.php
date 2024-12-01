<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class ViewBook
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle($request, Closure $next)
    {
        if ($request->user()) {
            $bookId = $request->route('id'); 
    
            if ($bookId && is_numeric($bookId)) {
                $bookId = intval($bookId);
    
                $views = cache()->get("user_{$request->user()->id_NguoiDung}_book_views", []);
    
                $views = array_filter($views, 'is_numeric');
                $views = array_map('intval', $views);
    
                array_unshift($views, $bookId);
                if (count($views) > 20) {
                    array_pop($views); 
                }
                cache()->put("user_{$request->user()->id_NguoiDung}_book_views", $views, 60 * 60 * 24 * 30); 
            }
        }
        return $next($request);
    }
}
