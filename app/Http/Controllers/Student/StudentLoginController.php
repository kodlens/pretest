<?php

namespace App\Http\Controllers\Student;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class StudentLoginController extends Controller
{
    //
    use AuthenticatesUsers;

    public function __construct()
    {
        $this->middleware('guest:student')->except('logout');
    }

//    public function index(){
//        return view('student.login');
//    }

    public function showLoginForm()
    {
        return view('student.login');
    }

    // public function guard()
    // {
    //     return Auth::guard('student');
    // }

    public function username()
    {
        return 'username';
    }

    public function redirectTo(){
        return '/student/home';
    }

//    public function authenticate(Request $request)
//    {
//        $validate = $request->validate([
//            'StudID' => ['string', 'max:100', 'required'],
//            'password' => ['string', 'max:255', 'required'],
//        ]);
//        $credentials = $request->only('StudID', 'password');
//
//        if (Auth::guard('student')->attempt($credentials)) {
//            // Authentication passed...
//            //return redirect()->intended('/home');
//            return 'success';
//        }
//    }


}
