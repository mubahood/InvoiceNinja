<?php

namespace App\Models;

use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class NewsPost extends Model
{
    use HasFactory;
    public function category()
    {
        return $this->belongsTo(PostCategory::class, 'post_category_id');
    }

    public function created_by()
    {
        return $this->belongsTo(Administrator::class, 'administrator_id');
    }

    public function getPostCategoryTextAttribute()
    {
        $d = PostCategory::find($this->post_category_id);
        if ($d == null) {
            return 'Not Subcounty.';
        }
        return $d->name;
    }
    protected $appends = ['post_category_text'];
}
