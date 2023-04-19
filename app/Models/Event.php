<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Event extends Model
{
    use HasFactory;

    public function tickets()
    {
        return $this->hasMany(EventTicket::class);
    }

    public function bookings()
    {
        return $this->hasMany(EventBooking::class);
    }

    public function speakers()
    {
        return $this->hasMany(EventSpeaker::class);
    }
}
