<?php

//use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Request;
use Carbon\Carbon;
use App\Models\Program;

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
    'register' => true,
    'login' => true,
    'verify' => true
]);


//ADDRESS CONTROLLER HERE

Route::get('/provinces', [App\Http\Controllers\AddressController::class, 'provinces']);
Route::get('/cities', [App\Http\Controllers\AddressController::class, 'cities']);
Route::get('/barangays', [App\Http\Controllers\AddressController::class, 'barangays']);




//////////////////ADDRESS///////////////////

//registration of account
//Route::resource('/registration', App\Http\Controllers\Student\RegistrationController::class);


//STUDENT
//Route::get('/student/login', [App\Http\Controllers\Student\StudentLoginController::class, 'showLoginForm']);
//Route::post('/student/login', [App\Http\Controllers\Student\StudentLoginController::class, 'login'])->name('student-login');

//DISPLAY SECTIONS WITH SCHEDULE ID AS PARAM


Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::post('/section', [App\Http\Controllers\Student\SectionPageController::class, 'index']);
Route::resource('/section-question', App\Http\Controllers\Student\SectionQuestionController::class);

Route::post('/taking-exam', [App\Http\Controllers\Student\TakingExamController::class, 'index']);


Route::get('/taking-exam-question/{sectionid}', [App\Http\Controllers\Student\TakingExamController::class, 'examineeQuestion']);
Route::get('/result-exam', [App\Http\Controllers\Student\ResultExamController::class, 'index']);
Route::get('/fetch-result-exam', [App\Http\Controllers\Student\ResultExamController::class, 'resultExam']);

Route::post('/taking-exam-submit', [App\Http\Controllers\Student\TakingExamController::class, 'store']);


Route::post('/set-schedule', [App\Http\Controllers\Student\StudentScheduleController::class, 'setSchedule']);
Route::get('/get-schedule', [App\Http\Controllers\Student\StudentScheduleController::class, 'getSchedule']);

//STUDENT //////////////STUDENT /////////////STUDENT




//ADMINISTRATOR

//LOGIN OF PANEL CONTROLLER
//Route::post('/panel', [App\Http\Controllers\Administrator\PanelLoginController::class, 'index'])->name('panel');
//Route::get('/panel/login', [App\Http\Controllers\Administrator\PanelLoginController::class, 'showLoginForm']);
//Route::post('/panel/login', [App\Http\Controllers\Administrator\PanelLoginController::class, 'login'])->name('panel-login');


Route::get('/panel/home', [App\Http\Controllers\Administrator\PanelHomeController::class, 'index']);


//ACAD YEAR
Route::resource('/panel/acadyear', App\Http\Controllers\Administrator\AcadYearController::class);
Route::get('/fetch-acadyears', [App\Http\Controllers\Administrator\AcadYearController::class, 'index_data']);


//SECTIONS
Route::resource('/panel/section', App\Http\Controllers\Administrator\SectionController::class);
Route::get('/fetch-sections', [App\Http\Controllers\Administrator\SectionController::class, 'index_data']);


//SCHEDULES
Route::resource('/panel/test-schedule', App\Http\Controllers\Administrator\TestScheduleController::class);
Route::get('/fetch-test-schedules', [App\Http\Controllers\Administrator\TestScheduleController::class, 'index_data']);

//STUDENT SCHEDULE
Route::resource('/panel/student-schedule', App\Http\Controllers\Administrator\StudentTestScheduleController::class);
Route::get('/fetch-student-schedules', [App\Http\Controllers\Administrator\StudentTestScheduleController::class, 'index_data']);
Route::get('/fetch-schedules', [App\Http\Controllers\Administrator\StudentTestScheduleController::class, 'getSchedules']);



//STUDENT SECTION TAKEN
Route::resource('/panel/student-section-taken', App\Http\Controllers\Administrator\StudentSectionTakenController::class);
Route::get('/fetch-student-section-taken', [App\Http\Controllers\Administrator\StudentSectionTakenController::class, 'index_data']);
Route::post('/delete-student-section-taken', [App\Http\Controllers\Administrator\StudentSectionTakenController::class, 'deleteTaken']);




//QUESTIONS
Route::resource('/panel/question', App\Http\Controllers\Administrator\QuestionController::class);
Route::get('/ajax/question', [App\Http\Controllers\Administrator\QuestionController::class, 'index_data']);
//Route::get('/ajax/question/sections', [App\Http\Controllers\Administrator\QuestionController::class, 'ajax_section']);

//Student Answer
Route::resource('/panel/student-answer', App\Http\Controllers\Administrator\StudentAnswerController::class);
Route::get('/fetch-student-answer', [App\Http\Controllers\Administrator\StudentAnswerController::class, 'index_data']);


//Student Result
Route::resource('/panel/student-result', App\Http\Controllers\Administrator\StudentResultController::class);
Route::get('/fetch-student-result', [App\Http\Controllers\Administrator\StudentResultController::class, 'index_data']);


//options
Route::get('/panel/question-option', [App\Http\Controllers\Administrator\PanelHomeController::class, 'index']);
Route::resource('/panel/question-option', App\Http\Controllers\Administrator\OptionController::class);
Route::get('/ajax/question-option', [App\Http\Controllers\Administrator\QuestionController::class, 'index_data']);


//ADMIT STUDENT
Route::resource('/panel/admit-student', App\Http\Controllers\Administrator\AdmitStudentController::class);





//USER
Route::resource('/panel/user', App\Http\Controllers\Administrator\UserController::class);
Route::get('/axios-users', [App\Http\Controllers\Administrator\UserController::class, 'index_data']);
Route::get('/fetch-students', [App\Http\Controllers\Administrator\UserController::class, 'allStudents']);
Route::post('/verify-email-students/{userid}', [App\Http\Controllers\Administrator\UserController::class, 'verifyEmailStudents']);




//REPORT
Route::resource('/panel/report-result', App\Http\Controllers\Administrator\ReportResultController::class);
Route::get('/panel/ajax-studentlist-result', [App\Http\Controllers\Administrator\ReportResultController::class, 'index_data']);
Route::get('/panel/report-excel-studentlist-result', [App\Http\Controllers\Administrator\ReportResultController::class, 'reportExcel']);
//admit student under the report controller
Route::post('/admit-student', [App\Http\Controllers\Administrator\ReportResultController::class, 'admitStudent']);


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


Route::get('/date', function(){

    $nDateTime = Carbon::now()->toDateTimeString();

    $is_allow = DB::table('test_schedules as a')
        ->join('student_schedules as b', 'a.test_schedule_id', 'b.test_schedule_id')
        ->where('a.from', '<=',$nDateTime)
        ->where('a.to', '>=', $nDateTime)
        ->where('b.user_id', 31)
        ->exists();
    //$isVisitedSection =

    return $is_allow;

//    if(!$is_allow){
//        return redirect('/home')
//            ->with('error', 'not_scheduled');
//    }
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

