<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StudentSchedule extends Model
{
    use HasFactory;

    protected $table = 'student_schedules';

    protected $primaryKey = 'student_schedule_id';

    protected $fillable = [
        'test_schedule_id',
        'user_id'
    ];


}
