<?php

use App\Models\Event;
use App\Models\EventTicket;
use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEventBookingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('event_bookings', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(Administrator::class);
            $table->foreignIdFor(Event::class);
            $table->foreignIdFor(EventTicket::class);
            $table->tinyInteger('is_paid');
            $table->tinyInteger('payment_approved');
            $table->integer('payment_approved_by');
            $table->tinyInteger('ticket_approved');
            $table->text('payment_method');
            $table->text('payment_account');
            $table->text('payment_transaction_id');
            $table->text('short_message');
            $table->text('admin_message');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('event_bookings');
    }
}
