<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AnswerSheet extends Model
{
    use HasFactory;

    protected $table = 'answer_sheets';
    protected $primaryKey = 'answer_sheet_id';

    protected $fillable = ['code', 'user_id', 'section_id', 'is_taken', 'date_taken'];

    // public function student(){
    //     return $this->hasOne(Student::class, 'StudID', 'student_id');
    // }

    public function answers(){
        return $this->hasMany(Answer::class, 'answer_sheet_id', 'answer_sheet_id')
        ->join('options', 'answers.option_id', 'options.option_id')
        ->join('questions', 'questions.question_id', 'options.question_id')
        ->select('answer_id', 'answer_sheet_id', 'answers.option_id', 'letter', 'content', 'img_path', 'is_answer',
            'question', 'is_question_img', 'question_img');
    }




}
