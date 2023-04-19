<?php

namespace App\Admin\Controllers;

use App\Models\Crop;
use App\Models\CropProtocol;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class CropProtocolController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Production Guide Item';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new CropProtocol());

        $grid->disableBatchActions();
        $grid->model()->orderBy('step', 'asc');
        $grid->column('step', __('STEP'))->sortable();
        $grid->column('name', __('Activity'));
        $grid->column('is_before_planting', __('Is before planting'));
        $grid->column('is_activity_required', __('Is activity required'));
        $grid->column('days_before_planting', __('Days before planting'));
        $grid->column('days_after_planting', __('Days after planting'));
        $grid->column('acceptable_timeline', __('Acceptable timeline'));
        $grid->column('value', __('Value'));
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
        $show = new Show(CropProtocol::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('name', __('Name'));
        $show->field('is_before_planting', __('Is before planting'));
        $show->field('is_activity_required', __('Is activity required'));
        $show->field('days_before_planting', __('Days before planting'));
        $show->field('days_after_planting', __('Days after planting'));
        $show->field('acceptable_timeline', __('Acceptable timeline'));
        $show->field('value', __('Value'));
        $show->field('step', __('Step'));
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
        $form = new Form(new CropProtocol());


        $form->select('crop_id', __('Select crop'))
            ->options(Crop::all()->pluck('name', 'id'))->rules('required');
        $form->text('name', __('Activity Name'))->required();
        $form->decimal('step', __('Step'))->required();
        $form->decimal('value', __('Value (Out of 5)'))->required();
        $form->radio('is_before_planting', 'Actvity type')
            ->options([
                'Pre-planting' => 'Pre-planting',
                'Post-planting' => 'Post-planting',
            ])
            ->when('Pre-planting', function ($f) {
                $f->decimal('days_before_planting', __('Days before planting'))->rules('required');
            })
            ->when('Post-planting', function ($f) {
                $f->decimal('days_after_planting', __('Days after planting'))->rules('required');
            })
            ->rules('required');

        $form->decimal('acceptable_timeline', __('Acceptable period (In Days)'))->required();

        $form->radio('is_activity_required', __('Is this activity compulsory?'))
            ->options([
                'Yes' => 'Yes',
                'No' => 'No',
            ])
            ->rules('required');
        $form->textarea('details', __('Details'));

        $form->disableViewCheck();
        $form->disableReset();

        return $form;
    }
}
