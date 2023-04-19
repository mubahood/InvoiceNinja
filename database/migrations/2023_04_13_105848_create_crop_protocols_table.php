<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCropProtocolsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('crop_protocols', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->string('name')->nullable();
            $table->string('is_before_planting')->nullable();
            $table->string('is_activity_required')->nullable();
            $table->integer('days_before_planting')->nullable();
            $table->integer('days_after_planting')->nullable();
            $table->integer('acceptable_timeline')->nullable();
            $table->integer('value')->nullable();
            $table->integer('step')->nullable();
            $table->text('details')->nullable();
        });
    }


    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('crop_protocols');
    }
}
