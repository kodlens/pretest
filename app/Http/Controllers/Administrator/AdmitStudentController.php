<?php

namespace App\Http\Controllers\Administrator;

use App\Http\Controllers\Controller;
use App\Models\AcadYear;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;


use App\Models\Program;


class AdmitStudentController extends Controller
{
    //
    public function __construct(){
        $this->middleware('auth');
        $this->middleware('staff');
    }

    public function index(){
        $programs = Program::where('programStat', 1)->get();
        return view('panel.admission.admit-student')
            ->with('programs', $programs);
    }






}
