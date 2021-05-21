<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class LevelSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $levels = [
            ['level' => 'EASY'],
            ['level' => 'AVERAGE'],
            ['level' => 'DIFFICULT'],
        ];

        \App\Models\Level::insert($levels);
    }
}
