<?php

namespace App\Http\Controllers\Administrator;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class ReportResultController extends Controller
{
    //
    public function __construct(){
        $this->middleware('auth:admin');
    }

    public function index(){
        return view('panel.report.report-result');
    }


   
    
}
