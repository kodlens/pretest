<?php

namespace App\Http\Controllers\Student;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;

class RegistrationController extends Controller
{
    //

    public function index(){
        return view('registration');
    }

    public function store(Request $req){

        $validate = $req->validate([
            'username' => ['string', 'max:255', 'required', 'unique:users'],
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
        ]);

        User::create([
            'username' => $req->username,
            'lname' => $req->lname,
            'fname' => $req->fname,
            'mname' => $req->mname,
            'sex' => $req->sex,
            'bdate' => $req->bdate,
            'contact_no' => $req->contact_no,
            'email' => $req->email,
            'last_school_attended' => $req->last_school_attended,
            'province' => $req->province,
            'city' => $req->city,
            'barangay' => $req->barangay['barangay'],
            'barangay_id' => $req->barangay['barangay_id'],
            'street' => $req->street,
        ]);


    }

}
