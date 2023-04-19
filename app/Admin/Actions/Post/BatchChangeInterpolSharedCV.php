<?php

namespace App\Admin\Actions\Post;

use Encore\Admin\Actions\BatchAction;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;


class BatchChangeInterpolSharedCV extends BatchAction
{
    public $name = 'Shared CV';

    public function handle(Collection $collection, Request $r)
    {
        $i = 0;
        foreach ($collection as $model) {
            $model->stage = 'Shared Cv';
            $model->cv_shared_with_partners = $r->get('cv_shared_with_partners');
            $i++;
            $model->save();
        }
        return $this->response()->success("Updated $i Successfully.")->refresh();
    }



    public function form()
    {
        $this->select('cv_shared_with_partners', __('CV shared with partners'))
            ->options([
                'Company 1' => 'Company 1',
                'Company 2' => 'Company 2',
                'Company 3' => 'Company 3'
            ])->rules('required');
    }
}
