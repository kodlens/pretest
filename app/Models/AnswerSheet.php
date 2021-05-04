<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AnswerSheet extends Model
{
    use HasFactory;

    protected $table = 'answer_sheets';
    protected $primaryKey = 'answer_sheet_id';

    protected $fillable = ['code', 'student_id', 'is_taken', 'date_taken'];
}
