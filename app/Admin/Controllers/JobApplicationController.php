<?php

namespace App\Admin\Controllers;

use App\Models\JobApplication;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class JobApplicationController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'JobApplication';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new JobApplication());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('job_provider_id', __('Job provider id'));
        $grid->column('job_applicant_id', __('Job applicant id'));
        $grid->column('job_id', __('Job id'));
        $grid->column('applicant_message', __('Applicant message'));
        $grid->column('provider_message', __('Provider message'));
        $grid->column('stage', __('Stage'));

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
        $show = new Show(JobApplication::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('job_provider_id', __('Job provider id'));
        $show->field('job_applicant_id', __('Job applicant id'));
        $show->field('job_id', __('Job id'));
        $show->field('applicant_message', __('Applicant message'));
        $show->field('provider_message', __('Provider message'));
        $show->field('stage', __('Stage'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new JobApplication());

        $form->number('job_provider_id', __('Job provider id'));
        $form->number('job_applicant_id', __('Job applicant id'));
        $form->number('job_id', __('Job id'));
        $form->textarea('applicant_message', __('Applicant message'));
        $form->textarea('provider_message', __('Provider message'));
        $form->textarea('stage', __('Stage'));

        return $form;
    }
}
