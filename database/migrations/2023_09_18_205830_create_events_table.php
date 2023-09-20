<?php

use App\Models\Application;
use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEventsTable extends Migration
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
            $table->foreignIdFor(Administrator::class);
            $table->foreignIdFor(Application::class);
            $table->string('reminder_state')->default('On')->nullable();
            $table->string('priority')->default('Medium')->nullable();
            $table->dateTime('event_date')->nullable();
            $table->dateTime('reminder_date')->nullable();
            $table->text('description')->nullable();
            $table->integer('remind_beofre_days')->nullable();
            $table->text('users_to_notify')->nullable();
            $table->string('reminders_sent')->default('No')->nullable();
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
