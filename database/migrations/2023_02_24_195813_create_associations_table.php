<?php

use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAssociationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('associations', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(Administrator::class);
            $table->text('name')->nullable();
            $table->text('about')->nullable();
            $table->text('address')->nullable();
            $table->text('parish')->nullable();
            $table->text('village')->nullable();
            $table->text('phone_number')->nullable();
            $table->text('email')->nullable();
            $table->text('district_id')->nullable();
            $table->integer('subcounty_id')->nullable();
            $table->integer('members')->nullable();
            $table->text('website')->nullable();
            $table->text('phone_number_2')->nullable();
            $table->text('vision')->nullable();
            $table->text('mission')->nullable();
            $table->text('photo')->nullable();
            $table->text('gps_latitude')->nullable();
            $table->text('gps_longitude')->nullable();
            $table->text('status')->default('Pending')->nullable();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('associations');
    }
}
