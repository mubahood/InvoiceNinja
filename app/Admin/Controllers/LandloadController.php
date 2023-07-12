<?php

namespace App\Admin\Controllers;

use App\Models\Landload;
use App\Models\Utils;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class LandloadController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Landlords';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Landload());

        $grid->filter(function ($filter) {
            // Remove the default id filter
            $filter->disableIdFilter();
            $filter->group('balance', function ($group) {
                $group->gt('greater than');
                $group->lt('less than');
                $group->equal('equal to');
            });
        });



        $grid->quickSearch('name')->placeholder('Search by name....');
        $grid->model()->orderBy('id', 'desc');
        $grid->disableBatchActions();
        $grid->column('id', __('ID'))->sortable();


        $grid->column('name', __('Name'))->sortable();
        $grid->column('email', __('Email'))->hide();
        $grid->column('phone_number', __('Phone number'));
        $grid->column('phone_number_2', __('Phone number 2'))->hide();
        $grid->column('address', __('Address'))->sortable();
        $grid->column('balance', __('Balance (UGX)'))
            ->display(function ($x) {
                return number_format($x);
            })->totalRow(function ($x) {
                return  number_format($x);
            })->sortable();
        $grid->column('fully_paid', __('Fully Paid'))
            ->dot([
                'No' => 'danger',
                'Yes' => 'success',
            ])
            ->filter([
                'Yes' => 'Fully paid',
                'No' => 'Nto fully paid',
            ])
            ->sortable();

        $grid->column('estates', __('Eestates'))
            ->display(function ($x) {
                return "<a class=\"d-block text-primary text-center\" title=\"Click to view\" target=\"_blank\" href='" . admin_url('houses') . "?landload_id={$this->id}'><b>" . count($this->houses) . "</b></a>";
            });
        $grid->column('report', __('Report'))
            ->display(function ($x) {
                return "<a class=\"d-block text-primary text-center\" target=\"_blank\" href='" . url('landlord-report') . "?id={$this->id}'><b>PRINT</b></a>";
            })->sortable();

        $grid->column('created_at', __('Date'))->display(function ($x) {
            return Utils::my_date_time($x);
        })
            ->hide()
            ->sortable();
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
        $show = new Show(Landload::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('name', __('Name'));
        $show->field('email', __('Email'));
        $show->field('phone_number', __('Phone number'));
        $show->field('phone_number_2', __('Phone number 2'));
        $show->field('address', __('Address'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Landload());
        $form->text('name', __('Name'))->rules('required');
        $form->text('email', __('Email'));
        $form->text('phone_number', __('Phone number'))->rules('required');
        $form->text('phone_number_2', __('Phone number 2'));
        $form->text('address', __('Address'))->rules('required');

        return $form;
    }
}
