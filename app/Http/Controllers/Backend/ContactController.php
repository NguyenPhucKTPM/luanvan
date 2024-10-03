<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class ContactController extends Controller
{
    public function __construct() {}

    public function index()
    {
        return view('pages.layouts.contact', [
            'title' => 'Liên hệ',
            'tab' => 'Liên hệ'
        ]);
    }
}
