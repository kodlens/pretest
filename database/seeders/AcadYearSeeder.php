<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class AcadYearSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $acads = [
            [
                'code' => '202',
                'description' => 'ACADEMIC YEAR 2020-2021 2nd SEMESTER',
                'active' => 1,
            ],
            [
                'code' => '203',
                'description' => 'ACADEMIC YEAR 2020-2021 SUMMER',
                'active' => 0,
            ],
            [
                'code' => '211',
                'description' => 'ACADEMIC YEAR 2021-2022 1st SEMESTER',
                'active' => 0,
            ],

        ];

        \App\Models\AcadYear::insertOrIgnore($acads);
    }
}
