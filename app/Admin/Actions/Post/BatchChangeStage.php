<?php

namespace App\Admin\Actions\Post;

use Encore\Admin\Actions\BatchAction;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;


class BatchChangeStage extends BatchAction
{
    public $name = 'Change stage';

    public function handle(Collection $collection, Request $r)
    {
        $i = 0;
        foreach ($collection as $model) {
            $model->stage = $r->get('stage');
            $i++;
            $model->save();
        }

        return $this->response()->success("Updated $i Successfully.")->refresh();
    }



    public function form()
    {
        $this->select('stage', __('Stage'))
            ->options([
                'Musaned' => 'Musaned',
                'Interpol' => 'Interpol',
                'Shared CV' => 'Shared CV',
                'Training' => 'Training',
                'Ministry' => 'Ministry',
            ])->rules('required');
    }
}
