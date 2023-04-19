<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Invoice extends Model
{
    use HasFactory;

    public function items()
    {
        return $this->hasMany(InvoiceItem::class);
    }

    public function do_process()
    {

        $tot = 0;
        foreach ($this->items as $key => $item) {
            if ($item->pro == null) {
                continue;
            }
            $item->name = $item->pro->name;
            $item->price = $item->pro->price;
            $item->total = $item->quantity*$item->pro->price;
            $item->save();
            $tot+= $item->total;

        }
        $this->total = $tot;
        $this->balance = $tot - $this->paid;
        $this->processed = 'Yes';
        $this->save();
      
    }
}
