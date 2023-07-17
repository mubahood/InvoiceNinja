<?php

namespace App\Admin\Controllers;

use App\Models\Location;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class SubcountyController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Areas';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Location());
        $grid->quickSearch('name')->placeholder('Search by name....');
        $grid->disableBatchActions();
        $grid->model()->where('parent', '>', 0)->orderBy('name', 'asc');
        $grid->column('name', __('Name'))->sortable();
        $grid->column('cases_', __('Cases'))->display(function ($x) {
            $x = count($this->cases_by_subs);
            return '<a target="_blank" title="View These Estates" class="d-block text-left  text-primary" style="font-size: 16px; text-align: center;" href="' . admin_url('cases?sub_county_id=' . $this->id) . '" ><b>' . $x . '</b></a>';
        });
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
        $show = new Show(Location::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('name', __('Name'));
        $show->field('parent', __('Parent'));
        $show->field('photo', __('Photo'));
        $show->field('details', __('Details'));
        $show->field('order', __('Order'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Location());

        $form->select('parent', __('District'))->options(Location::get_districts_array())->rules('required');
        $form->text('name', __('Name'))->rules('required');

        $form->hidden('order', __('Parent'))->default(0);
        $form->text('details', __('Details'));
        return $form;
    }
}
