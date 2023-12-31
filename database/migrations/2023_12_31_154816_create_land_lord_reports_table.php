<?php

use App\Models\Landload;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLandLordReportsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('land_lord_reports', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(Landload::class);
            $table->text('land_lord_name')->nullable();
            $table->text('land_lord_email')->nullable();
            $table->text('land_lord_phone')->nullable();
            $table->text('land_lord_address')->nullable();
            $table->date('start_date')->nullable();
            $table->date('end_date')->nullable();
            $table->text('regenerate_report')->nullable();
            $table->bigInteger('total_income')->nullable();
            $table->bigInteger('total_expense')->nullable();
            $table->bigInteger('total_payment')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('land_lord_reports');
    }
}
