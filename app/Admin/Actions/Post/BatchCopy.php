<?php

namespace App\Admin\Actions\Post;

use Encore\Admin\Actions\BatchAction;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;


class BatchCopy extends BatchAction
{
    public $name = 'Batch Copy';

    public function handle(Collection $collection, Request $r)
    {
        $i = 0;
        foreach ($collection as $model) {
            $m = $model->replicate();

            $m->name .= ' - Copy';
            $m->is_active = 'Pending';
            $i++;
            $m->save();
        }

        return $this->response()->success("Updated $i Successfully.")->refresh();
    }
}
