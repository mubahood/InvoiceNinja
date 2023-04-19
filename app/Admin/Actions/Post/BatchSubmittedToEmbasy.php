<?php

namespace App\Admin\Actions\Post;

use Encore\Admin\Actions\BatchAction;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;


class BatchSubmittedToEmbasy extends BatchAction
{
    public $name = 'Submitted to embasy';

    public function handle(Collection $collection, Request $r)
    {
        $i = 0;
        foreach ($collection as $model) {
            $model->stage = 'Embasy';
            /*             $model->training_start_date = $r->get('training_start_date');
            $model->training_end_date = $r->get('training_end_date'); */
            $i++;
            $model->save();
        }

        return $this->response()->success("Updated $i Successfully.")->refresh();
    }



    /*     public function form()
    {

        $this->date('training_start_date', __('Training start date'))
            ->rules('required');

        $this->date('training_end_date', __('Training end date'))
            ->rules('required');
    } */
}
