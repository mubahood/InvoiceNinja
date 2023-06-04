<?php

namespace App\Admin\Controllers;

use App\Models\Supplier;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class SupplierController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Suppliers';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Supplier());

        $grid->disableBatchActions();
        $grid->quickSearch('name')->placeholder('Search by Tool\'s number');
        $grid->column('name', __('Name'))->sortable(); 
        $grid->column('email', __('Email'));
        $grid->column('phone_number', __('Phone number'));
        $grid->column('address', __('Address'));
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
        $show = new Show(Supplier::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('name', __('Name'));
        $show->field('email', __('Email'));
        $show->field('phone_number', __('Phone number'));
        $show->field('address', __('Address'));
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
        $form = new Form(new Supplier());

        $form->text('name', __('Name'))->rules('required');
        $form->text('email', __('Email'))->rules('required');
        $form->text('phone_number', __('Phone number'))->rules('required');
        $form->text('address', __('Address'))->rules('required');
        $form->textarea('details', __('Dealers in'))->rules('required');

        return $form;
    }
}
