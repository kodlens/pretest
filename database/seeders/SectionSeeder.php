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
            ['section' => 'ABSTRACT REASONING'],
            ['section' => 'LOGICAL REASONING'],
            ['section' => 'ENGLISH PROFICIENCY'],
            ['section' => 'NUMERICAL REASONING'],
            ['section' => 'GENERAL KNOWLEDGE']
        ];

        \App\Models\Section::insert($sections);

        
    }
}
