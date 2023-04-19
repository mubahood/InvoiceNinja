<?php

use App\Models\Association;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGroupsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('groups', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(Association::class);
            $table->text('name')->nullable();
            $table->text('address')->nullable();
            $table->text('parish')->nullable();
            $table->text('village')->nullable();
            $table->text('phone_number')->nullable();
            $table->text('email')->nullable();
            $table->text('district_id')->nullable();
            $table->integer('subcounty_id')->nullable();
            $table->integer('members')->nullable();
            $table->text('phone_number_2')->nullable();
            $table->text('started')->default('Pending')->nullable();
            $table->text('leader')->default('Pending')->nullable();
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
        Schema::dropIfExists('groups');
    }
}
