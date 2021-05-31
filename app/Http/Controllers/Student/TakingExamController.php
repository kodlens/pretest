<?php

namespace App\Http\Controllers\Student;

use App\Http\Controllers\Controller;

use App\Models\AcadYear;
use App\Rules\SubmitResultRule;
use Illuminate\Http\Request;
use Illuminate\Database\Query\Builder;

use App\Models\Question;
use App\Models\AnswerSheet;
use App\Models\Answer;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;


class TakingExamController extends Controller
{
    //

    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('allow_exam');
    }


    public function index(Request $req){
        $user_id = auth()->user()->user_id;
        $ay = AcadYear::where('active', 1)->first();

        $isExist = AnswerSheet::where('user_id', $user_id)
            ->where('code', $ay->code)
                ->exists();

        if($isExist){
            return redirect('/section')
                ->with('isTaken', 1);
        }
        //tiwasonon

        return view('student.taking-exam')
            ->with('id', $req->section);
    }


    public function examineeQuestion(Request $req)
    {
        # code...
        $section_id = $req->section;
        $ay = AcadYear::where('active', 1)->first();
        $easy_question = Question::with(['options'])
            ->join('levels', 'questions.level_id', 'levels.level_id')
            ->where('acad_year_id', $ay->acad_year_id)
            ->where('level', 'EASY')
            ->where('section_id', $section_id)
            ->inRandomOrder()->take(6)->get();

        $average_question = Question::with(['options'])
            ->join('levels', 'questions.level_id', 'levels.level_id')
            ->where('acad_year_id', $ay->acad_year_id)
            ->where('level', 'AVERAGE')
            ->where('section_id', $section_id)
            ->inRandomOrder()->take(6)->get();

        $diff_question = Question::with(['options'])
            ->join('levels', 'questions.level_id', 'levels.level_id')
            ->where('acad_year_id', $ay->acad_year_id)
            ->where('level', 'DIFFICULT')
            ->where('section_id', $section_id)
            ->inRandomOrder()->take(6)->get();

        $data = array_merge($easy_question->toArray(),
            $average_question->toArray(),
            $diff_question->toArray());

        return $data;
    }

    public function examineeResult(){
        $student_id = auth()->user()->StudID;

    }

    public function store(Request $req){
        $student_id = auth()->user()->StudID;
        $ay = AcadYear::where('active', 1)->first();

        $n = AnswerSheet::where('student_id', $student_id)
            ->where('code', $ay->code)->exists();

        if($n){
            return ['status' => 'exist'];
        }

        try{
            DB::transaction(function() use ($req, $student_id) {
                $dateTaken = Carbon::now()->toDateString();

                $ay = AcadYear::where('active', 1)->first();

                $ansSheet = AnswerSheet::create([
                    'code' => $ay->code,
                    'student_id' => $student_id,
                    'is_taken' => 1,
                    'date_taken' => $dateTaken,
                ]);

                $arr=[];
                foreach($req->all() as $row){
                    if($row != null){
                        array_push($arr,[
                            'answer_sheet_id' => $ansSheet->answer_sheet_id,
                            'option_id' => $row
                        ]);
                    }
                }

                Answer::insert($arr);
            });
            return ['status' => 'saved'];
        }catch(\Exception $e){
            return ['status' => 'error', 'msg' => $e->getMessage()];
        }

    }



}
