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
            ['section' => 'ABSTRACT'],
            ['section' => 'NUMERICAL'],
            ['section' => 'LINGUISTICS'],
            ['section' => 'VOCABULARY'],
            ['section' => 'GENERAL KNOWLEDGE']
        ];

        \App\Models\Section::insert($sections);

        
    }
}
