<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Book;
use App\Services\BookRecommendationService;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    protected $recommendationService;
    public function __construct(BookRecommendationService $recommendationService)
    {
        $this->recommendationService = $recommendationService;
    }
    public function index(Request $request)
    {
        $getNewBook = Book::getNewBook();
        $getRecommended = $this->getRecommendedBooks($request);
        $getHotBook = Book::getHotBook();
        $getHotBook = $getHotBook ? $getHotBook : null;
        return view('pages.layouts.home', [
            'title' => 'Trang chủ',
            'tab' => '',
            'getNewBook' => $getNewBook,
            'getRecommended' => $getRecommended,
            'getHotBook' => $getHotBook,
        ]);
    }
    public function getRecommendedBooks(Request $request){
        $recommendedBooks = [];
        if(Auth::user()){
            $user = $request->user();
            $limit = $request->input('limit', 8); 
            $recommendedBooks = $this->recommendationService->getComprehensiveRecommendations($user, $limit);
        }
        return $recommendedBooks;
    }
}
