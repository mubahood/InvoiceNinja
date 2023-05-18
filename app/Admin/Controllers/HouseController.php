<?php

namespace App\Admin\Controllers;

use App\Models\House;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class HouseController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'House';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new House());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('landload_id', __('Landload id'));
        $grid->column('region_id', __('Region id'));
        $grid->column('area_id', __('Area id'));
        $grid->column('name', __('Name'));
        $grid->column('address', __('Address'));
        $grid->column('image', __('Image'));
        $grid->column('attachment', __('Attachment'));
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
        $show = new Show(House::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('landload_id', __('Landload id'));
        $show->field('region_id', __('Region id'));
        $show->field('area_id', __('Area id'));
        $show->field('name', __('Name'));
        $show->field('address', __('Address'));
        $show->field('image', __('Image'));
        $show->field('attachment', __('Attachment'));
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
        $form = new Form(new House());

        $form->number('landload_id', __('Landload id'));
        $form->number('region_id', __('Region id'));
        $form->number('area_id', __('Area id'));
        $form->textarea('name', __('Name'));
        $form->textarea('address', __('Address'));
        $form->textarea('image', __('Image'));
        $form->textarea('attachment', __('Attachment'));
        $form->textarea('details', __('Details'));

        return $form;
    }
}
