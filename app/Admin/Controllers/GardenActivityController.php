<?php

namespace App\Admin\Controllers;

use App\Models\GardenActivity;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class GardenActivityController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'GardenActivity';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new GardenActivity());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('garden_id', __('Garden id'));
        $grid->column('user_id', __('User id'));
        $grid->column('crop_activity_id', __('Crop activity id'));
        $grid->column('activity_name', __('Activity name'));
        $grid->column('activity_description', __('Activity description'));
        $grid->column('activity_date_to_be_done', __('Activity date to be done'));
        $grid->column('activity_due_date', __('Activity due date'));
        $grid->column('activity_date_done', __('Activity date done'));
        $grid->column('farmer_has_submitted', __('Farmer has submitted'));
        $grid->column('farmer_activity_status', __('Farmer activity status'));
        $grid->column('farmer_submission_date', __('Farmer submission date'));
        $grid->column('farmer_comment', __('Farmer comment'));
        $grid->column('agent_id', __('Agent id'));
        $grid->column('agent_names', __('Agent names'));
        $grid->column('agent_has_submitted', __('Agent has submitted'));
        $grid->column('agent_activity_status', __('Agent activity status'));
        $grid->column('agent_comment', __('Agent comment'));
        $grid->column('agent_submission_date', __('Agent submission date'));

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
        $show = new Show(GardenActivity::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('garden_id', __('Garden id'));
        $show->field('user_id', __('User id'));
        $show->field('crop_activity_id', __('Crop activity id'));
        $show->field('activity_name', __('Activity name'));
        $show->field('activity_description', __('Activity description'));
        $show->field('activity_date_to_be_done', __('Activity date to be done'));
        $show->field('activity_due_date', __('Activity due date'));
        $show->field('activity_date_done', __('Activity date done'));
        $show->field('farmer_has_submitted', __('Farmer has submitted'));
        $show->field('farmer_activity_status', __('Farmer activity status'));
        $show->field('farmer_submission_date', __('Farmer submission date'));
        $show->field('farmer_comment', __('Farmer comment'));
        $show->field('agent_id', __('Agent id'));
        $show->field('agent_names', __('Agent names'));
        $show->field('agent_has_submitted', __('Agent has submitted'));
        $show->field('agent_activity_status', __('Agent activity status'));
        $show->field('agent_comment', __('Agent comment'));
        $show->field('agent_submission_date', __('Agent submission date'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new GardenActivity());

        $form->number('garden_id', __('Garden id'));
        $form->number('user_id', __('User id'));
        $form->number('crop_activity_id', __('Crop activity id'));
        $form->textarea('activity_name', __('Activity name'));
        $form->textarea('activity_description', __('Activity description'));
        $form->textarea('activity_date_to_be_done', __('Activity date to be done'));
        $form->textarea('activity_due_date', __('Activity due date'));
        $form->textarea('activity_date_done', __('Activity date done'));
        $form->text('farmer_has_submitted', __('Farmer has submitted'));
        $form->text('farmer_activity_status', __('Farmer activity status'));
        $form->text('farmer_submission_date', __('Farmer submission date'));
        $form->textarea('farmer_comment', __('Farmer comment'));
        $form->number('agent_id', __('Agent id'));
        $form->text('agent_names', __('Agent names'));
        $form->text('agent_has_submitted', __('Agent has submitted'));
        $form->text('agent_activity_status', __('Agent activity status'));
        $form->text('agent_comment', __('Agent comment'));
        $form->text('agent_submission_date', __('Agent submission date'));

        return $form;
    }
}
