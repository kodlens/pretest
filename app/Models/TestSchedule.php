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

    protected $fillable = ['test_from', 'test_to', 'remark', 'active'];

}
