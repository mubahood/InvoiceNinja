<?php

namespace App\Models;

use Dflydev\DotAccessData\Util;
use Exception;
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
        self::deleting(function ($m) {
            if ($m->id == 1) {
                throw new Exception("You cannot delete this house.", 1);
            }
            Room::where([
                'house_id' => $m->id
            ])->update([
                'house_id' => 1
            ]);
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
        $l = Landload::find($this->landload_id);
        if ($l == null) {
            $this->landload_id = 1;
            $this->save();
        }
        return $this->belongsTo(Landload::class);
    }

    public function rooms()
    {
        return $this->hasMany(Room::class);
    }

    public function occupied_rooms()
    {
        return $this->hasMany(Room::class)->where(['status' => 'Occupied']);
    }
    public function vacant_rooms()
    {
        return $this->hasMany(Room::class)->where(['status' => 'Vacant']);
    }

    public function price_range()
    {
        $minRoom = $this->rooms()->min('price');
        $maxRoom = $this->rooms()->max('price');
        $priceRange = Utils::number_format($minRoom,'') . " - " . Utils::number_format($maxRoom,'');
        return $priceRange;
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
