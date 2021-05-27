<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // \App\Models\User::factory(10)->create();

        //add Class Seeder to Seed DB here ...
        $this->call([
            UserSeeder::class,
            SectionSeeder::class,
            LevelSeeder::class,
            AcadYearSeeder::class,
            QuestionSeeder::class,
            OptionSeeder::class,
        ]);
    }
}
