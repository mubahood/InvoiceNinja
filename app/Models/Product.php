<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    public function sales(){
        return $this->hasMany(InvoiceItem::class,'product_id');
    }
    public function getSubcountyTextAttribute()
    {
        $d = Location::find($this->subcounty_id);
        if ($d == null) {
            return 'Not Subcounty.';
        }
        return $d->name_text;
    }
    protected $appends = ['subcounty_text'];

}
