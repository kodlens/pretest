<?php

namespace App\Http\Controllers\Student;

use App\Http\Controllers\Controller;
use App\Models\Section;
use Illuminate\Http\Request;

class SectionPageController extends Controller
{
    //
    public function __construct(){
        $this->middleware('auth');
    }

    public function index(){
        $sections = Section::select('section_id', 'section', 'img_filename', 'set_time')
            ->get();
        return view('student.section-page')
            ->with('sections', $sections);
    }
}
