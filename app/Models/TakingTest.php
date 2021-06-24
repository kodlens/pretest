<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TakingTest extends Model
{
    use HasFactory;

    protected $table = 'taking_test';

    protected $primaryKey = 'taking_test_id';

    protected $fillable = [
        'acad_year_id',
        'user_id',
        'section_id'
    ];

}
