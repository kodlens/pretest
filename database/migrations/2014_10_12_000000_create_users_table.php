<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

use App\Models\User;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id('user_id');
            $table->string('username')->unique();
            $table->string('lname');
            $table->string('fname');
            $table->string('mname')->null();
            $table->string('sex', 10)->null();
            $table->date('bdate');
            $table->string('birthplace');
            $table->string('contact_no');
            $table->string('email')->unique();
            $table->string('last_school_attended')->nullable();
            $table->string('province');
            $table->string('city');
            $table->string('barangay');
            $table->integer('barangay_id');
            $table->string('street')->nullable();

            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->string('role',20)->null();
            $table->rememberToken();
            $table->timestamps();
        });

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
