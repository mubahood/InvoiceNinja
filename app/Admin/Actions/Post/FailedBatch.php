<?php

namespace App\Admin\Actions\Post;

use Encore\Admin\Actions\BatchAction;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;


class FailedBatch extends BatchAction
{
    public $name = 'Failed at this level';

    public function handle(Collection $collection, Request $r)
    {
        $i = 0;
        foreach ($collection as $model) {
            $model->stage = 'Failed';
            $model->failed_reason = $r->get('failed_reason');
            $i++;
            $model->save();
        }

        return $this->response()->success("Updated $i Successfully.")->refresh();
    }



    public function form()
    {
        $this->textarea('failed_reason', __('Enter reason for failure'))
            ->required()
            ->rules('required');
    }
}
