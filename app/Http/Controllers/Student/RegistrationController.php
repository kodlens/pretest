<?php

namespace App\Http\Controllers\Student;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

use App\Models\Program;


class RegistrationController extends Controller
{
    //

    public function index(){
        $programs = Program::all();
        return view('registration')
            ->with('programs', $programs);
    }

    public function store(Request $req){

        $validate = $req->validate([
            'username' => ['string', 'max:255', 'required', 'unique:users'],
            'password' => ['string', 'max:50', 'min:4', 'required', 'confirmed'],
            'lname' => ['string', 'max:255', 'required'],
            'fname' => ['string', 'max:255', 'required'],
            'mname' => ['string', 'max:255', 'required'],
            'sex' => ['string', 'max:255', 'required'],
            'bdate' => ['required'],
            'contact_no' => ['string', 'max:255', 'required'],
            'email' => ['string', 'max:255', 'required', 'unique:users'],
            'last_school_attended' => ['string', 'max:255', 'required'],
            'province' => ['string', 'max:255', 'required'],
            'city' => ['string', 'max:255', 'required'],
            'barangay.barangay_id' => ['required'],

        ],$message =[
            'bdate.required' => 'Birthdate is required.',
            'barangay.barangay_id' => 'Barangay is required.',
            'password.confirmed' => 'Your password does not match.',
        ]);

        User::create([
            'username' => $req->username,
            'password' => Hash::make($req->password),
            'lname' => $req->lname,
            'fname' => $req->fname,
            'mname' => $req->mname,
            'sex' => $req->sex,
            'bdate' => $req->bdate,
            'birthplace' => $req->birthplace,
            'contact_no' => $req->contact_no,
            'email' => $req->email,
            'last_school_attended' => $req->last_school_attended,
            'province' => $req->province,
            'city' => $req->city,
            'barangay' => $req->barangay['barangay'],
            'barangay_id' => $req->barangay['barangay_id'],
            'street' => $req->street,
            'role' => 'STUDENT',
        ]);
        
        return ['status' => 'saved'];

    }

}
