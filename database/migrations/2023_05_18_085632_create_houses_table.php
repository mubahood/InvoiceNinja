<?php

use App\Models\Landload;
use App\Models\Location;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHousesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('houses', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(Landload::class);
            $table->foreignIdFor(Location::class, 'region_id');
            $table->foreignIdFor(Location::class, 'area_id');
            $table->text('name')->nullable();
            $table->text('address')->nullable();
            $table->text('image')->nullable();
            $table->text('attachment')->nullable();
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
        Schema::dropIfExists('houses');
    }
}
