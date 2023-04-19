<?php

use App\Models\Disability;
use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateInstitutionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('institutions', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(Administrator::class);
            $table->foreignIdFor(Disability::class);
            $table->text('name')->nullable();
            $table->text('about')->nullable();
            $table->text('address')->nullable();
            $table->text('parish')->nullable();
            $table->text('village')->nullable();
            $table->text('phone_number')->nullable();
            $table->text('email')->nullable();
            $table->text('district_id')->nullable();
            $table->integer('subcounty_id')->nullable();
            $table->text('website')->nullable();
            $table->text('phone_number_2')->nullable();
            $table->text('photo')->nullable();
            $table->text('gps_latitude')->nullable();
            $table->text('gps_longitude')->nullable();
            $table->text('status')->default('Pending')->nullable();
            $table->text('skills')->default('Pending')->nullable();
            $table->text('fees_range')->default('Pending')->nullable();
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
        Schema::dropIfExists('institutions');
    }
}
