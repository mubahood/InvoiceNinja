<?php

namespace App\Admin\Controllers;

use App\Models\Landload;
use App\Models\LandLordReport;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class LandLordReportController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Landlord Reports';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new LandLordReport());

        $grid->filter(function ($filter) {
            // Remove the default id filter
            $filter->disableIdFilter();
            $filter->equal('landload_id', 'Filter by landlord')
                ->select(
                    Landload::where([])->orderBy('name', 'Asc')->get()->pluck('name', 'id')
                );
        });

        $grid->model()->orderBy('id', 'desc');
        $grid->disableBatchActions();
        $grid->column('id', __('ID'))->sortable();

        $grid->column('landload_id', __('Landload'))
            ->display(function ($x) {
                $y = Landload::find($x)->name;
                if($y == null){
                    $y->delete();
                    return 'Deleted'; 
                }
                $y->name;
            })->sortable();
        $grid->column('start_date', __('Start Date'))
            ->display(function ($x) {
                return date('d M Y', strtotime($x));
            })->sortable();
        $grid->column('end_date', __('End Date'))
            ->display(function ($x) {
                return date('d M Y', strtotime($x));
            })->sortable();

        $grid->column('report', __('Report'))
            ->display(function ($x) {
                return "<a class=\"d-block text-primary text-center\" target=\"_blank\" href='" . url('landlord-report-1') . "?id={$this->id}'><b>PRINT REPORT</b></a>";
                $url = "<a style=' line-height: 10px;' class=\"p-0 m-0 mb-2 d-block text-primary text-center\" target=\"_blank\" href='" . url('landlord-report-1') . "?id={$this->id}'><b>PRINT REPORT (Design 1)</b></a>";
                $url .= "<a  style=' line-height: 10px;' class=\"d-block text-primary text-center\" target=\"_blank\" href='" . url('landlord-report') . "?id={$this->id}'><b>PRINT REPORT (Design 2)</b></a><br>";
                return $url;
            })->sortable();

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
        $show = new Show(LandLordReport::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('landload_id', __('Landload id'));
        $show->field('land_lord_name', __('Land lord name'));
        $show->field('land_lord_email', __('Land lord email'));
        $show->field('land_lord_phone', __('Land lord phone'));
        $show->field('land_lord_address', __('Land lord address'));
        $show->field('start_date', __('Start date'));
        $show->field('end_date', __('End date'));
        $show->field('regenerate_report', __('Regenerate report'));
        $show->field('total_income', __('Total income'));
        $show->field('total_expense', __('Total expense'));
        $show->field('total_payment', __('Total payment'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new LandLordReport());
        $form->select('landload_id', __('Landlord'))
            ->options(Landload::where([])->orderBy('name', 'asc')->get()->pluck('name', 'id'))
            ->rules('required');

        //date picker range
        $form->dateRange('start_date', 'end_date', 'Report Date Range')
            ->rules('required');

        if ($form->isEditing()) {
            $form->radioCard('regenerate_report', __('Regenerate Report'))
                ->options(['Yes' => 'Yes', 'No' => 'No'])
                ->default('No');
        } else {
            $form->hidden('regenerate_report')->default('Yes');
        }

        $form->decimal('total_expense', 'Total Expense (UGX)')
            ->rules('required');

        $form->disableCreatingCheck();
        $form->disableEditingCheck();
        $form->disableViewCheck();


        return $form;
    }
}
