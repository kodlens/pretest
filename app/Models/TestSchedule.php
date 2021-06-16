<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TestSchedule extends Model
{
    use HasFactory;


    protected $connection = 'mysql';

    protected $table = 'test_schedules';

    protected $primaryKey = 'test_schedule_id';

    protected $fillable = ['acad_year_id',
        'description',
        'from', 'to', 'max_user', 'nt_user'
    ];

}
