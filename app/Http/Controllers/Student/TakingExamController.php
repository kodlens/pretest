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
        $this->middleware('auth:student');

        $this->middleware('allow_exam');
    }


    public function index(){
        $student_id = auth()->user()->StudID;
        $isExist = AnswerSheet::where('student_id', $student_id)->exists();

        if($isExist){
            return redirect('/student/home');
        }

        return view('student.taking-exam');
    }


    public function examineeQuestion()
    {
        # code...

        return Question::with(['options' => function($query){
                $query->select('question_id', 'option_id', 'letter', 'content', 'is_img', 'img_path');
        }])
            ->select('question_id','question', 'is_question_img', 'question_img')
            ->inRandomOrder()
            ->get();
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
                    array_push($arr,[
                        'answer_sheet_id' => $ansSheet->answer_sheet_id,
                        'option_id' => $row
                    ]);
                }

                Answer::insert($arr);
            });
            return ['status' => 'saved'];
        }catch(\Exception $e){
            return ['status' => 'error', 'msg' => $e->getMessage()];
        }

    }



}
