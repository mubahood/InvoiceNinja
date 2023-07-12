<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class House extends Model
{
    use HasFactory;

    public static function boot()
    {
        parent::boot();
        self::creating(function ($m) {
            return House::my_update($m);
        });
        self::updating(function ($m) {
            return House::my_update($m);
        });
    }

    public static function get_houses()
    {
        $houses = [];
        foreach (House::where([])->orderBy('name', 'asc')->get() as $key => $h) {
            $houses[$h->id] = $h->name . " - " . $h->landload->name;
        }
        return $houses;
    }

    public function landload()
    {
        return $this->belongsTo(Landload::class);
    }

    public function rooms()
    {
        return $this->hasMany(Room::class);
    }
    public function getNameTextAttribute()
    {
        $name = $this->name;
        if ($this->landload != null) {
            $name .= ", " . $this->landload->name;
        }
        return $name;
    }

    public static function my_update($m)
    {
        $m->region_id  = 1;
        $loc = Location::find($m->area_id);
        if ($loc != null) {
            $m->region_id = $loc->parent;
        }
        return $m;
    }

    public function getImageAttribute($value)
    {
        if ($value == null || $value == '' || strlen($value) < 3) {
            return url('logo.jpg');
        }
        return $value;
    }

    protected $appends = ['name_text'];
}
