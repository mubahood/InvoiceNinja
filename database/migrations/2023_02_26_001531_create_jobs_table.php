<?php

use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateJobsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('jobs', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(Administrator::class);
            $table->text('title')->nullable();
            $table->text('short_description')->nullable();
            $table->text('details')->nullable();
            $table->text('nature_of_job')->nullable();
            $table->text('minimum_academic_qualification')->nullable();
            $table->text('required_expirience')->nullable();
            $table->text('expirience_period')->nullable();
            $table->text('category')->nullable();
            $table->text('photo')->nullable();
            $table->text('how_to_apply')->nullable();
            $table->text('whatsapp')->nullable();
            $table->text('subcounty_id')->nullable();
            $table->text('district_id')->nullable(); 
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('jobs');
    }
}
