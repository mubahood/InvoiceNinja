<?php

namespace App\Models;

use Carbon\Carbon;
use Exception;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Application extends Model
{
    use HasFactory;

    public function attarchments()
    {
        return $this->hasMany(Attarchment::class);
    }

    public static function boot()
    {
        parent::boot();
        self::creating(function ($m) {
            return Application::my_update($m);
        });
        self::updating(function ($m) {
            return Application::my_update($m);
        });
    }

    public static function my_update($m)
    {
        if ($m->reminder_state == 'On') {
            $m->reminder_date = Carbon::now()->addDays((int) $m->reminder_days);
        }
        return $m;
    }
}
