<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSectionsTable extends Migration
{

    protected $connection = 'mysql';


    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sections', function (Blueprint $table) {
            $table->id('section_id');
            $table->string('section', 255)->null();
            $table->timestamps();
        });

        $sections = [
            ['section' => 'ABSTRACT'],
            ['section' => 'NUMERICAL'],
            ['section' => 'LINGUISTICS'],
            ['section' => 'VOCABULARY'],
            ['section' => 'GENERAL KNOWLEDGE']
        ];

        \App\Models\Section::insert($sections);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('sections');
    }
}
