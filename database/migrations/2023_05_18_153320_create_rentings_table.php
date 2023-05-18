<?php

use App\Models\House;
use App\Models\Tenant;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRentingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('rentings', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(House::class);
            $table->foreignIdFor(Tenant::class);
            $table->text('start_date')->nullable();
            $table->text('end_date')->nullable();
            $table->integer('number_of_months')->nullable();
            $table->integer('discount')->nullable();
            $table->integer('payable_amount')->nullable();
            $table->integer('balance')->nullable();
            $table->string('is_in_house')->nullable();
            $table->string('is_overstay')->nullable();
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
        Schema::dropIfExists('rentings');
    }
}
