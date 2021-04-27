<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');

});

Auth::routes([
    'register' => false,
    'login' => false,
]);


Route::get('/student/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');



//STUDENT
Route::get('/student/login', [App\Http\Controllers\Student\StudentLoginController::class, 'showLoginForm']);
Route::post('/student/login', [App\Http\Controllers\Student\StudentLoginController::class, 'login'])->name('student-login');





//ADMINISTRATOR

//LOGIN OF PANEL CONTROLLER
//Route::post('/panel', [App\Http\Controllers\Administrator\PanelLoginController::class, 'index'])->name('panel');
Route::get('/panel/login', [App\Http\Controllers\Administrator\PanelLoginController::class, 'showLoginForm']);
Route::post('/panel/login', [App\Http\Controllers\Administrator\PanelLoginController::class, 'login'])->name('panel-login');


Route::get('/panel/home', [App\Http\Controllers\Administrator\PanelHomeController::class, 'index']);
Route::resource('/panel/question', App\Http\Controllers\Administrator\QuestionController::class);
Route::get('/ajax/question', [App\Http\Controllers\Administrator\QuestionController::class, 'index_data']);
Route::get('/ajax/question/sections', [App\Http\Controllers\Administrator\QuestionController::class, 'ajax_section']);

//options
Route::get('/panel/question-option', [App\Http\Controllers\Administrator\PanelHomeController::class, 'index']);
Route::resource('/panel/question-option', App\Http\Controllers\Administrator\OptionController::class);
Route::get('/ajax/question-option', [App\Http\Controllers\Administrator\QuestionController::class, 'index_data']);



//SECTION
Route::resource('/panel/section', App\Http\Controllers\Administrator\SectionController::class);
Route::get('/ajax/section', [App\Http\Controllers\Administrator\SectionController::class, 'index_data']);















//for debugging mode-----

Route::get('/app/user', function(){
        if(Auth::guard('student')->check()){
            return 'student guard';
        }
        if(Auth::guard('admin')->check()){
            return 'admin guard';
        }
    return 'please login';

});

Route::get('/app/logout', function(){
    Auth::guard('student')->logout();
    Auth::logout();
});

Route::get('/app/logout/admin', function(){
    Auth::guard('admin')->logout();
    Auth::logout();
});

