<?php

namespace App\Admin\Actions\Post;

use Encore\Admin\Actions\BatchAction;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;


class BatchReadForDeparture extends BatchAction
{
    public $name = 'Ready For Departure';

    public function handle(Collection $collection, Request $r)
    {
        $i = 0;
        foreach ($collection as $model) {
            $model->stage = 'Departure';
            $model->training_start_date = $r->get('depature_date');
            $i++;
            $model->save();
        }

        return $this->response()->success("Updated $i Successfully.")->refresh();
    }



    public function form()
    {

        $this->date('depature_date', __('Depature date'))
            ->rules('required');
    }
}
