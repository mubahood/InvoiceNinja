<?php

namespace App\Models;

use Carbon\Carbon;
use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Event extends Model
{
    use HasFactory;

    public static function boot()
    {
        parent::boot();
        self::creating(function ($m) {
            return Event::my_update($m);
        });
        self::updating(function ($m) {
            return Event::my_update($m);
        });
    }

    public static function my_update($m)
    {
        if ($m->reminder_state == 'On') {
            $m->reminder_date = Carbon::parse($m->event_date)->subDays((int) $m->remind_beofre_days);
        }
        return $m;
    }

    public function application()
    {
        return $this->belongsTo(Application::class);
    }
    public function user()
    {
        return $this->belongsTo(Administrator::class, 'administrator_id');
    }

    public function setUsersToNotifyAttribute($value)
    {
        if (is_array($value)) {
            $this->attributes['users_to_notify'] = implode(',', $value);
        }
    }


    public function getUsersToNotifyAttribute($value)
    {
        return explode(',', $value);
    }
}
