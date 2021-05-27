<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class SectionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $sections = [
            [
                'section' => 'ABSTRACT REASONING',
                'img_filename' => 'abstraction.svg',
                'set_time' => 10,
            ],
            [
                'section' => 'LOGICAL REASONING',
                'img_filename' => 'logical.svg',
                'set_time' => 10,
            ],
            [
                'section' => 'ENGLISH PROFICIENCY',
                'img_filename' => 'english.svg',
                'set_time' => 10,
            ],
            [
                'section' => 'NUMERICAL REASONING',
                'img_filename' => 'numerical.svg',
                'set_time' => 10,
            ],
            [
                'section' => 'GENERAL KNOWLEDGE',
                'img_filename' => 'general.svg',
                'set_time' => 10,
            ]
        ];

        \App\Models\Section::insertOrIgnore($sections);

    }
}
