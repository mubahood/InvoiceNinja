<?php

namespace App\Models;

use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EventBooking extends Model
{
    use HasFactory;

    public function booked_by()
    {
        return $this->belongsTo(Administrator::class, 'administrator_id');
    }

    public function event()
    {
        return $this->belongsTo(Event::class, 'event_id');
    }

    public function event_ticket()
    {
        return $this->belongsTo(EventTicket::class, 'event_ticket_id');
    }
}
