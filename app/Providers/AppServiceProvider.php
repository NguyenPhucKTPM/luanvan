<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Backend\UserController; 
class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
         // Truyền thông tin đăng nhập vào mọi view
    View::composer('*', function ($view) {
        if (Auth::check()) {
            $userController = app(UserController::class);
            $userInfo = $userController->getInformationSessionUser();
            $view->with('user', $userInfo);
            // dd($userInfo);
        }
    });
    }
}