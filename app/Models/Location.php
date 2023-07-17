<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Location extends Model
{
    use HasFactory;

    public static function get_sub_counties_array()
    {
        $subs = [];
        foreach (Location::get_sub_counties() as $key => $value) {
            $subs[$value->id] = ((string)($value->name)) . ", " . ((string)($value->district_name));
        }
        return $subs;
    }

    public static function get_districts_array()
    {
        $subs = [];
        foreach (Location::get_districts() as $key => $value) {
            $subs[$value->id] = ((string)($value->name));
        }
        return $subs;
    }

    public function cases()
    {
        return $this->hasMany(CaseModel::class, 'district_id');
    }

    public function cases_by_subs()
    {
        return $this->hasMany(CaseModel::class, 'sub_county_id');
    }

    public function houses()
    {
        return $this->hasMany(House::class, 'area_id');
    }
    public function estates()
    {
        return $this->hasMany(House::class, 'region_id');
    }

    public function district()
    {
        return $this->belongsTo(Location::class, 'parent');
    }
    public static function get_sub_counties()
    {
        $sql = "SELECT locations.id as id, locations.name as name, districts.name as district_name FROM  locations, districts WHERE  locations.parent = districts.id AND locations.parent > 0";
        return DB::select($sql);
    }

    public static function get_districts()
    {
        return Location::where(
            'parent',
            '<',
            1
        )->get();
    }


    public static function boot()
    {
        parent::boot();
        self::deleting(function ($m) {
            die("You can't delete this item.");
        });
    }

    public function getNameTextAttribute()
    {
        if (((int)($this->parent)) > 0) {
            $mother = Location::find($this->parent);

            if ($mother != null) {
                return $mother->name . ", " . $this->name;
            }
        }
        return $this->name;
    }

    protected $appends = ['name_text'];
}
