<?php

namespace App\Http\Controllers\Administrator;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class ResultExamController extends Controller
{
    //
    public function __construct(){
        $this->middleware('auth');
    }

}
