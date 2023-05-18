<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tenant extends Model
{
    use HasFactory;




    public static function get_items()
    {
        $items = [];
        foreach (Tenant::where([])->orderBy('name', 'asc')->get() as $key => $h) {
            $items[$h->id] = "#" . $h->id . " - " . $h->name;
        }
        return $items;
    }

}
