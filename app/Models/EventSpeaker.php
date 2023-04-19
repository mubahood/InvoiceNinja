<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EventSpeaker extends Model
{
    use HasFactory; 
    protected $fillable = [
        'created_at',
        'updated_at',
        'event_id',
        'name',
        'details',
        'photo', 
        'designation', 
    ];
}
