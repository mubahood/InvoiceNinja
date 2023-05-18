<?php

use App\Models\Landload;
use App\Models\Location;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRoomsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('rooms', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(Landload::class);
            $table->foreignIdFor(Location::class, 'region_id');
            $table->foreignIdFor(Location::class, 'area_id');
            $table->text('name')->nullable();
            $table->string('status')->nullable();
            $table->string('is_active')->nullable()->default('No');
            $table->integer('number_of_rooms')->nullable();
            $table->text('room_size')->nullable();
            $table->integer('bed_rooms')->nullable();
            $table->integer('sitting_rooms')->nullable();
            $table->integer('dining_rooms')->nullable();
            $table->integer('indoor_toilets')->nullable();
            $table->integer('price')->nullable();
            $table->integer('landload_price')->nullable();
            $table->text('image')->nullable();
            $table->text('images')->nullable();
            $table->text('furnishings')->nullable();
            $table->text('utilities')->nullable();
            $table->text('internet_access')->nullable();
            $table->text('security')->nullable();
            $table->text('amenities')->nullable();
            $table->text('remarks')->nullable();
        });
    }


    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('rooms');
    }
}
