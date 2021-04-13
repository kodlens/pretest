<?php

namespace App\Http\Controllers\Administrator;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class SectionController extends Controller
{
    //

    public function __construct(){
        $this->middleware('auth:admin');
    }

    public function index(){
        return view('panel.section.panel-section');
    }

    public function create(){
        return view('panel.section.panel-section-create');
    }

    public function store(Request $req){
        return $req;
    }


}
