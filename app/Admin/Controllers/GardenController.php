<?php

namespace App\Admin\Controllers;

use App\Models\Crop;
use App\Models\Garden;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Auth;

class GardenController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Garden';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Garden());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('name', __('Name'));
        $grid->column('crop_name', __('Crop name')); 
        $grid->column('production_scale', __('Production scale'));
        $grid->column('planting_date', __('Planting date'));
        $grid->column('land_occupied', __('Land occupied'));
        $grid->column('crop_id', __('Crop id'));
        $grid->column('details', __('Details'));

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Garden::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('name', __('Name'));
        $show->field('crop_name', __('Crop name'));
        $show->field('status', __('Status'));
        $show->field('production_scale', __('Production scale'));
        $show->field('planting_date', __('Planting date'));
        $show->field('land_occupied', __('Land occupied'));
        $show->field('crop_id', __('Crop id'));
        $show->field('details', __('Details'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Garden());


        if (
            (Auth::user()->isRole('admin'))
        ) {

            $ajax_url = url(
                '/api/ajax?'
                    . "search_by_1=name"
                    . "&search_by_2=id"
                    . "&model=User"
            );
            $form->select('user_id', "Garden mananger")
                ->options(function ($id) {
                    $a = Administrator::find($id);
                    if ($a) {
                        return [$a->id => "#" . $a->id . " - " . $a->name];
                    }
                })
                ->ajax($ajax_url)->rules('required');
        } else {
            $form->select('user_id', __('Garden mananger'))
                ->options(Administrator::where('id', Auth::user()->id)->get()->pluck('name', 'id'))->default(Auth::user()->id)->readOnly()->rules('required');
        }

        $form->select('crop_id', __('Select crop'))
            ->options(Crop::all()->pluck('name', 'id'))->rules('required');

        $form->text('name', __('Garden Name'))->rules('required');


        if ($form->isEditing()) {
            $form->radio('status', __('Status'))->options([
                'Active' => 'Active',
                'Not Active' => 'Not Active',
            ])->rules('required');
        }
        $form->date('planting_date', __('Planting date'))->rules('required');

        $form->select('production_scale', __('Production scale'))
            ->options([
                'Small scale' => 'Small scale',
                'Medium scale' => 'Medium scale', 
                'Large scale' => 'Large scale',
            ]);

        $form->decimal('land_occupied', __('Land occupied (In Acres)'))->rules('required');
        $form->textarea('details', __('Details'));

        $form->disableCreatingCheck();
        $form->disableEditingCheck();
        $form->disableViewCheck();
        $form->disableReset();

        return $form;
    }
}
