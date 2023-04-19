<?php

namespace App\Admin\Actions\Post;

use Encore\Admin\Actions\BatchAction;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;


class InterpolSumitted extends BatchAction
{
    public $name = 'Ready for Interpol';

    public function handle(Collection $collection, Request $r)
    {
        $i = 0;
        foreach ($collection as $model) {
            $model->stage = 'Interpol';
            $model->interpal_appointment_date = $r->get('interpal_appointment_date');
            $i++;
            $model->save();
        }

        return $this->response()->success("Updated $i Successfully.")->refresh();
    }



    public function form()
    {

        $this->select('stage', __('Next Stage'))
            ->options([
                'Interpol' => 'Interpol'
            ])->rules('required');
        $this->date('interpal_appointment_date', __('Interpol appointment date'))
            ->rules('required');
    }
}
