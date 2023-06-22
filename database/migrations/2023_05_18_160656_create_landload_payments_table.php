<?php

use App\Models\Landload;
use App\Models\Renting;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLandloadPaymentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('landload_payments', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(Renting::class)->nullable();
            $table->foreignIdFor(Landload::class);
            $table->integer('amount');
            $table->text('details');
           
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('landload_payments');
    }
}
