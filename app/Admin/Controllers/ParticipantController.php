<?php

namespace App\Admin\Controllers;

use App\Models\Participant;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class ParticipantController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Participants';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Participant());

        $grid->column('id', __('#'));
        $grid->column('created_at', __('Created at')); 
        $grid->column('ref', __('Ref'));
        $grid->column('name', __('Name'));
        $grid->column('email', __('Email'));
        $grid->column('whatsapp', __('Whatsapp'));
        $grid->column('country', __('Country'));
        $grid->column('message', __('Message'));

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
        $show = new Show(Participant::findOrFail($id));

        $show->field('id', __('#'));
        $show->field('created_at', __('Created'));
        $show->field('ref', __('Ref'));
        $show->field('name', __('Name'));
        $show->field('email', __('Email'));
        $show->field('whatsapp', __('Whatsapp'));
        $show->field('country', __('Country'));
        $show->field('message', __('Message'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Participant());

        $form->textarea('ref', __('Ref'));
        $form->textarea('name', __('Name'));
        $form->textarea('email', __('Email'));
        $form->textarea('whatsapp', __('Whatsapp'));
        $form->textarea('country', __('Country'));
        $form->textarea('message', __('Message'));

        return $form;
    }
}
