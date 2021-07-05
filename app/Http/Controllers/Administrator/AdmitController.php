<?php

namespace App\Http\Controllers\Administrator;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;


use App\Models\Gadtest;

class AdmitController extends Controller
{
    //

    public function admitStudent(Request $req){
        $n = time() . $req->user_id;
        $studentCode = substr(md5($n), -6);

        return Gadtest::all();

        return $studentCode;
    }
}
