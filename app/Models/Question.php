<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Question extends Model
{
    use HasFactory;

    protected $connection = 'mysql';

    protected $table = 'questions';
    protected $primaryKey = 'question_id';

    protected $fillable = ['question', 'points'];


}
