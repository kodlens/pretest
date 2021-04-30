<?php

namespace App\Http\Controllers\Administrator;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreQuestionRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

use App\Models\Question;
use App\Models\Section;
use App\Models\Option;

class QuestionController extends Controller
{
    //

    public function __construct(){
        $this->middleware('auth:admin');
    }

    public function index(){
        return view('panel.question.panel-question');
    }

    public function index_data(Request $req){
        //return Question::all();
        $sortkey = explode(".",$req->sort_by);

        return Question::with(['options', 'section'])
            ->whereHas('section', function ($query) use ($req){ //(Builder $query)
                $query->where('section', 'like', $req->section .'%');
            })
            ->orderBy($sortkey[0], $sortkey[1])
            ->paginate($req->perpage);
    }

    public function create(){
        return view('panel.question.panel-question-create');
    }

    public function ajax_section(){
        return Section::all();
    }

    public function store(Request $req){

        $validate = $req->validate([
            'section' => ['required'],
            'score' => ['required', 'numeric', 'min: 1']
        ]);

        try{
            $file = $req->file('question_img');

            if($file){
                //if question is file
                \DB::transaction(function() use ($req, $file){
                    $options = json_decode($req->options);
                    //decode to json stringify JSON from javascript

                    $destinationPath = 'img/q/';
                    //$fileName = time() . $file->getClientOriginalName();
                    $fileName = md5(time()). '.' . $file->extension();

                    $question = Question::create([
                        'order_no' => $req->order_no,
                        'section_id' => $req->section,
                        'is_question_img' => 1,
                        'question_img' => $destinationPath . $fileName,
                        'question' => trim($req->question),
                        'score' => $req->score
                    ]);

                    $q_id = $question->question_id;
                    $arr=[];

                    foreach($options as $row){
                        array_push($arr, [
                            'question_id' => $q_id,
                            'letter' => $row->optionLetter,
                            'content' => trim($row->content),
                            'is_img' => $row->is_img,
                            'img_path' => trim($row->img_path),
                            'is_answer' => $row->is_answer,
                        ]);
                    }

                    Option::insert($arr);

                    //move the file to the folder
                    $file->move($destinationPath , $fileName);

                }); //end db transaction

            }else{

                //$options = json_decode($req->options);
                //return $test;
                \DB::transaction(function() use($req){
                    $options = json_decode($req->options);
                    $question = Question::create([
                        'order_no' => $req->order_no,
                        'section_id' => $req->section,
                        'question' => trim($req->question),
                        'score' => $req->score
                    ]);
                    $q_id = $question->question_id;
                    $arr=[];
                    foreach($options as $row){
                        array_push($arr, [
                            'question_id' => $q_id,
                            'letter' => $row->optionLetter,
                            'content' => trim($row->content),
                            'is_img' => $row->is_img,
                            'img_path' => trim($row->img_path),
                            'is_answer' => $row->is_answer,
                        ]);
                    }
                    Option::insert($arr);
                }); //end db transaction
            }
           return ['status' => 'saved'];
        }catch(\Exception $e){
            return ['status' => 'error', 'msg' => $e->getMessage()];
        }
    }

    public function show($id){
        return Question::with(['options'])->where('question_id', $id)
            ->first();
    }

    public function update(Request $req, $id){
        $validate = $req->validate([
            //'order_no' => ['required', 'numeric', Rule::unique('questions')->ignore($id, 'question_id')],
            'section' => ['required', 'numeric'],
            'question' => ['required_without:question_img'],
            'question_img' => ['required_without:question'],
            'score' => ['required', 'numeric', 'min: 1']
        ]);

        $question = Question::find($id);

        $question->order_no = $req->order_no;
        $question->section_id = $req->section;
        $question->question = trim($req->question);
        $question->score = $req->score;
        $question->save();

        foreach($req->options as $row){
            Option::where('option_id', $row['option_id'])
                ->update([
                    'question_id' => $id,
                    'letter' => $row['letter'],
                    'content' => trim($row['content']),
                    'is_img' => $row['is_img'],
                    'img_path' => trim($row['img_path']),
                    'is_answer' => $row['is_answer'],

                ]);

        }

        return [['status' => 'updated']];
       // return $req;
    }






    public function destroy($id){
        Question::destroy($id);
        return [['status' => 'deleted']];
    }


}
