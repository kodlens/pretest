<?php

//use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Request;
use Carbon\Carbon;
use App\Models\TestSchedule;

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
    'login' => true,
]);


//ADDRESS CONTROLLER HERE

Route::get('/provinces', [App\Http\Controllers\AddressController::class, 'provinces']);
Route::get('/cities', [App\Http\Controllers\AddressController::class, 'cities']);
Route::get('/barangays', [App\Http\Controllers\AddressController::class, 'barangays']);




//////////////////ADDRESS///////////////////

//registration of account
Route::resource('/registration', App\Http\Controllers\Student\RegistrationController::class);


//STUDENT
//Route::get('/student/login', [App\Http\Controllers\Student\StudentLoginController::class, 'showLoginForm']);
//Route::post('/student/login', [App\Http\Controllers\Student\StudentLoginController::class, 'login'])->name('student-login');
Route::resource('/section', App\Http\Controllers\Student\SectionPageController::class);

Route::resource('/section-question', App\Http\Controllers\Student\SectionQuestionController::class);


Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::resource('/taking-exam', App\Http\Controllers\Student\TakingExamController::class);
Route::get('/student/taking-exam-question', [App\Http\Controllers\Student\TakingExamController::class, 'examineeQuestion']);
Route::get('/student/result-exam', [App\Http\Controllers\Student\ResultExamController::class, 'index']);
Route::get('/student/ajax-result-exam', [App\Http\Controllers\Student\ResultExamController::class, 'resultExam']);





//ADMINISTRATOR

//LOGIN OF PANEL CONTROLLER
//Route::post('/panel', [App\Http\Controllers\Administrator\PanelLoginController::class, 'index'])->name('panel');
Route::get('/panel/login', [App\Http\Controllers\Administrator\PanelLoginController::class, 'showLoginForm']);
Route::post('/panel/login', [App\Http\Controllers\Administrator\PanelLoginController::class, 'login'])->name('panel-login');


Route::get('/panel/home', [App\Http\Controllers\Administrator\PanelHomeController::class, 'index']);
Route::resource('/panel/question', App\Http\Controllers\Administrator\QuestionController::class);
Route::get('/ajax/question', [App\Http\Controllers\Administrator\QuestionController::class, 'index_data']);
//Route::get('/ajax/question/sections', [App\Http\Controllers\Administrator\QuestionController::class, 'ajax_section']);


//Answer
Route::resource('/panel/answer', App\Http\Controllers\Administrator\AnswerSheetController::class);
Route::get('/panel/ajax-answer', [App\Http\Controllers\Administrator\AnswerSheetController::class, 'index_data']);


//options
Route::get('/panel/question-option', [App\Http\Controllers\Administrator\PanelHomeController::class, 'index']);
Route::resource('/panel/question-option', App\Http\Controllers\Administrator\OptionController::class);
Route::get('/ajax/question-option', [App\Http\Controllers\Administrator\QuestionController::class, 'index_data']);



//SECTION
Route::resource('/panel/section', App\Http\Controllers\Administrator\SectionController::class);
Route::get('/ajax/section', [App\Http\Controllers\Administrator\SectionController::class, 'index_data']);


//USER
Route::resource('/panel/user', App\Http\Controllers\Administrator\UserController::class);
Route::get('/axios-users', [App\Http\Controllers\Administrator\UserController::class, 'index_data']);




//REPORT
Route::resource('/panel/report-result', App\Http\Controllers\Administrator\ReportResultController::class);
Route::get('/panel/ajax-studentlist-result', [App\Http\Controllers\Administrator\ReportResultController::class, 'index_data']);


Route::get('/session-test', function(Request $req){
    return session()->all();
});




//for debugging mode-----

//Route::get('/app/user', function(){
//
//    User::create([
//        'username' => 'guidance',
//        'lname' => 'SUMALINOG',
//        'fname' => 'BERNICE',
//        'mname' => '',
//        'sex' => 'FEMALE',
//        'email' => 'guidance@gadtest',
//        'password' => Hash::make('gu1dance$$'),
//        'role' => 'ADMINISTRATOR',
//    ]);
//
//});

Route::get('/app/logout', function(){
    Auth::guard('student')->logout();
    Auth::logout();
});

Route::get('/app/logout/admin', function(){
    Auth::guard('admin')->logout();
    Auth::logout();
});


Route::get('/check-redis', function(){
    print_r(app()->make('redis'));
});

//Route::get('/app/test', function(){
//
//    $sampleTime = '2021-04-29 15:50:00';
//
//    $test = TestSchedule::where('test_from', '<=',$sampleTime)
//        ->where('test_to', '>=', $sampleTime)->exists();
//   // $date = Carbon::now()->toDateTimeString();
//    return $test;
//});

