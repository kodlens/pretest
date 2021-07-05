<?php

namespace App\Http\Controllers\Administrator;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Section;

class SectionController extends Controller
{
    //

    public function __construct(){
        $this->middleware('auth');
        $this->middleware('admin');
    }

    public function index(){
        return view('panel.section.panel-section');
    }

    public function index_data(Request $req){
        $sort = explode('.', $req->sort_by);
        $data = Section::orderBy($sort[0], $sort[1])
            ->paginate($req->perpage);

        return $data;
    }

    public function create(){
        return view('panel.section.panel-section-create');
    }

    public function store(Request $req){
        return $req;
    }


}
