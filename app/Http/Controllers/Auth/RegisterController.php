<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use App\Models\User;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

use App\Models\Program;
use App\Models\LearningModality;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
        $this->middleware('allow_registration');
        
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */

     public function showRegistrationForm (){
         $programs = Program::where('programStat', 1)->get();
         $learningmodes = LearningModality::all();

         //return $learningmodes;

         return view('auth.register')
            ->with('programs', $programs ? $programs : '')
            ->with('learningmodes', $learningmodes);  
     }


    protected function validator(array $data)
    {
        return Validator::make($data, [
            'username' => ['string', 'max:255', 'required', 'unique:users'],
            'password' => ['string', 'max:50', 'min:4', 'required', 'confirmed'],
            'lname' => ['string', 'max:255', 'required'],
            'fname' => ['string', 'max:255', 'required'],
            'sex' => ['string', 'max:255', 'required'],
            'status' => ['string', 'max:50', 'required'],
            'bdate' => ['required'],
            'contact_no' => ['string', 'max:255', 'required'],
            'email' => ['string', 'max:255', 'required', 'unique:users'],
            'first_program_choice' => ['string', 'max:100', 'required', 'different:second_program_choice'],
            'second_program_choice' => ['string', 'max:100', 'required', 'different:first_program_choice'],
            'learning_mode' => ['string', 'max:255', 'required'],
            'last_school_attended' => ['string', 'max:255', 'required'],
            'province' => ['string', 'max:255', 'required'],
            'city' => ['string', 'max:255', 'required'],
            'barangay.barangay_id' => ['required'],
            ],$message =[
                'bdate.required' => 'Birthdate is required.',
                'barangay.barangay_id' => 'Barangay is required.',
                'password.confirmed' => 'Your password does not match.',
            ]
        );
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\Models\User
     */
    protected function create(array $data)
    {
        //return $data['barangay']['barangay'];
        

        return User::create([
            'username' => $data['username'],
            'password' => Hash::make($data['password']),
            'lname' => strtoupper($data['lname']),
            'fname' => strtoupper($data['fname']),
            'mname' => strtoupper($data['mname']),
            'sex' => $data['sex'],
            'status' => $data['status'],
            'bdate' => $data['bdate'],
            'birthplace' => strtoupper($data['birthplace']),
            'contact_no' => $data['contact_no'],
            'email' => $data['email'],
            'first_program_choice' => strtoupper($data['first_program_choice']),
            'second_program_choice' => strtoupper($data['second_program_choice']),
            'learning_mode' => strtoupper($data['learning_mode']),
            'last_school_attended' => strtoupper($data['last_school_attended']),
            'province' => $data['province'],
            'city' => $data['city'],
            'barangay' => $data['barangay']['barangay'],
            'barangay_id' => $data['barangay']['barangay_id'],
            'street' => $data['street'],
            'role' => 'STUDENT',
        ]);

    }
}
