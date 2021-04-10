<?php

namespace App\Http\Controllers\Administrator;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class QuestionController extends Controller
{
    //

    public function __construct(){
        $this->middleware('auth:admin');
    }

    public function index(){
        return view('panel.question.panel-question');
    }

    public function create(){
        return view('panel.question.panel-question-create');
    }


}
