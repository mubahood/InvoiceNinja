<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEevntsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('events', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->text('title');
            $table->text('theme');
            $table->text('photo');
            $table->text('details');
            $table->text('prev_event_title');
            $table->text('number_of_attendants');
            $table->text('number_of_speakers');
            $table->text('number_of_experts');
            $table->text('venue_name');
            $table->text('venue_photo');
            $table->text('venue_map_photo');
            $table->text('event_date');
            $table->text('address');
            $table->text('gps_latitude');
            $table->text('gps_longitude');
            $table->text('video');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('events');
    }
}
