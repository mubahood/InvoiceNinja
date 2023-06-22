<?php

namespace App\Admin\Controllers;

use App\Models\LandloadPayment;
use App\Models\Utils;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class LandloadPaymentController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Landlord Payments';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new LandloadPayment());
    
        $grid->model()->orderBy('id', 'desc');
        $grid->disableBatchActions();
        $grid->column('id', __('ID'))->sortable();
        $grid->column('created_at', __('Date'))->display(function ($x) {
            return Utils::my_date_time($x);
        })->sortable();
        $grid->column('renting_id', __('Renting'))->hide();
        $grid->column('landload_id', __('Landload'));
        $grid->column('amount', __('Amount'));
        $grid->column('amount_payable_to_landload', __('Amount Payable To Landload'));
        $grid->column('amount_payable_to_company', __('Amount Payable To Company'));
        
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
        $show = new Show(LandloadPayment::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('renting_id', __('Renting id'));
        $show->field('landload_id', __('Landload id'));
        $show->field('amount', __('Amount'));
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
        $form = new Form(new LandloadPayment());

        $form->number('renting_id', __('Renting id'));
        $form->number('landload_id', __('Landload id'));
        $form->number('amount', __('Amount'));
        $form->textarea('details', __('Details'));

        return $form;
    }
}
