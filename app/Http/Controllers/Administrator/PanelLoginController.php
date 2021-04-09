<?php

namespace App\Http\Controllers\Administrator;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Foundation\Auth\ThrottlesLogins;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;

class PanelLoginController extends Controller
{
    //
    use AuthenticatesUsers;

    public function __construct()
    {
        $this->middleware('guest:admin')->except('logout');
    }

//    public function index(){
//        return view('panel.panel-login');
//    }

    public function showLoginForm()
    {
        return view('panel.panel-login');
    }

    protected function guard()
    {
        return Auth::guard('admin');
    }

    public function redirectTo(){
        return '/panel-home';
    }

    public function username(){
        return 'username';
    }



//    public function authenticate(Request $request)
//    {
//        $validate = $request->validate([
//            $this->username() => ['string', 'max:100', 'required'],
//            'password' => ['string', 'max:255', 'required'],
//        ]);
//
//        $credentials = $request->only($this->username(), 'password');
//
//        if (Auth::guard('admin')->attempt($credentials)) {
//            // Authentication passed...
//            return 'success';
//            //return redirect()->intended('/cpanel-home');
//        }else{
//            return ValidationException::withMessages([
//                $this->username() => [trans('auth.failed')],
//            ]);
//        }
//    }




}
