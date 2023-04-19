<?php

use App\Models\Garden;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGardenActivitiesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('garden_activities', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(Garden::class);
            $table->integer('user_id');
            $table->integer('crop_activity_id');

            $table->text('activity_name')->nullable();
            $table->text('activity_description')->nullable();
            $table->text('activity_date_to_be_done')->nullable();
            $table->text('activity_due_date')->nullable();
            $table->text('activity_date_done')->nullable();

            $table->string('farmer_has_submitted')->nullable();
            $table->string('farmer_activity_status')->nullable();
            $table->string('farmer_submission_date')->nullable();
            $table->text('farmer_comment')->nullable();

            $table->integer('agent_id')->nullable();
            $table->string('agent_names')->nullable();
            $table->string('agent_has_submitted')->nullable();
            $table->string('agent_activity_status')->nullable();
            $table->string('agent_comment')->nullable();
            $table->string('agent_submission_date')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('garden_activities');
    }
}
