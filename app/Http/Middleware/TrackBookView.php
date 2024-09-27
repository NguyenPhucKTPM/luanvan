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
        $bookId = $request->route('id');

        if ($bookId && is_numeric($bookId)) {
            $bookId = intval($bookId);

            $views = cache()->get("book_views", []);

            $views = array_filter($views, 'is_numeric');
            $views = array_map('intval', $views);

            if (($key = array_search($bookId, $views)) !== false) {
                unset($views[$key]);
            }

            array_unshift($views, $bookId);

            $views = array_slice($views, 0, 20);

            cache()->put("book_views", $views, 60 * 60 * 5);
        }

        return $next($request);
    }
}
