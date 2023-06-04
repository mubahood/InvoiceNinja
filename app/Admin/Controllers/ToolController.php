<?php

namespace App\Admin\Controllers;

use App\Models\Tool;
use App\Models\Utils;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class ToolController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Tool';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Tool());
        $grid->disableBatchActions();
        $grid->column('photo', __('Photo'))
            ->lightbox(['width' => 60, 'height' => 60])
            ->sortable();
        $grid->quickSearch('name')->placeholder('Search by Tool\'s number');
        $grid->column('name', __('Name'))->sortable();
        $grid->column('serial_number', __('Serial number'))->sortable();
        $grid->column('certificate_number', __('Certificate'))->sortable();

        $grid->column('price', __('Worth (USD)'))
            ->display(function ($f) {
                if ($f == null || strlen($f) < 1) {
                    return '-';
                }
                return number_format(((int)($f)));
            })->sortable();

        $grid->column('details', __('Details'))->hide();

        $grid->column('monitor_calibration', __('Monitor Calibration'))
            ->dot([
                'Yes' => 'success',
                'No' => 'danger',
            ])->sortable();


        $grid->column('calibration_cycle', __('Calibration Cycle'))
            ->display(function ($f) {
                if ($f == null || strlen($f) < 1) {
                    return '-';
                }
                return ((int)($f)) . " Days";
            })->sortable();

        $grid->column('last_calibration_date', __('Last calibration'))
            ->display(function ($f) {
                return Utils::my_date($f);
            })->sortable();

        $grid->column('details', __('Details'))->hide();

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
        $show = new Show(Tool::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('name', __('Name'));
        $show->field('serial_number', __('Serial number'));
        $show->field('certificate_number', __('Certificate number'));
        $show->field('monitor_calibration', __('Monitor calibration'));
        $show->field('last_calibration_date', __('Last calibration date'));
        $show->field('photo', __('Photo'));
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
        $form = new Form(new Tool());


        $form->text('name', __('Tool No.'))->rules('required');
        $form->text('serial_number', __('Serial number'))->rules('required');
        $form->text('certificate_number', __('Certificate number'));
        $form->decimal('price', __('Tool\'s Worth (in USD)'))->rules('required');
        $form->radioCard('monitor_calibration', __(
            'Do you want to monitor calibration'
        ))
            ->options([
                'Yes' => 'Yes',
                'No' => 'No',
            ])
            ->when('Yes', function ($form) {
                $form->decimal('calibration_cycle', __('Calibration cycle (In Days)'))
                    ->rules('required');
                $form->date('last_calibration_date', __('Last calibration date'))
                    ->rules('required');
            })->rules('required');
        $form->image('photo', __('Tool\'s Photo'));
        $form->textarea('details', __('Details'));

        return $form;
    }
}
