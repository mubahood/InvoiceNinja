<?php

namespace App\Admin\Controllers;

use App\Models\ProductOrder;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class ProductOrderController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'ProductOrder';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new ProductOrder());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('seller_id', __('Seller id'));
        $grid->column('buyer_id', __('Buyer id'));
        $grid->column('product_id', __('Product id'));
        $grid->column('buyer_message', __('Buyer message'));
        $grid->column('buyer_contact', __('Buyer contact'));
        $grid->column('buyer_contact_2', __('Buyer contact 2'));
        $grid->column('seller_message', __('Seller message'));
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
        $show = new Show(ProductOrder::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('seller_id', __('Seller id'));
        $show->field('buyer_id', __('Buyer id'));
        $show->field('product_id', __('Product id'));
        $show->field('buyer_message', __('Buyer message'));
        $show->field('buyer_contact', __('Buyer contact'));
        $show->field('buyer_contact_2', __('Buyer contact 2'));
        $show->field('seller_message', __('Seller message'));
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
        $form = new Form(new ProductOrder());

        $form->number('seller_id', __('Seller id'));
        $form->number('buyer_id', __('Buyer id'));
        $form->number('product_id', __('Product id'));
        $form->textarea('buyer_message', __('Buyer message'));
        $form->textarea('buyer_contact', __('Buyer contact'));
        $form->textarea('buyer_contact_2', __('Buyer contact 2'));
        $form->textarea('seller_message', __('Seller message'));
        $form->textarea('stage', __('Stage'));

        return $form;
    }
}
