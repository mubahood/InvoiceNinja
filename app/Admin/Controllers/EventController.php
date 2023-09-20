<?php

namespace App\Admin\Controllers;

use App\Models\Application;
use App\Models\Event;
use App\Models\Utils;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class EventController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Scheduled Events';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {

        $grid = new Grid(new Event());
        $conditions = [];
        $u = auth()->user();
        if (!$u->isRole('admin')) {
            $conditions['administrator_id'] = $u->id;
        }

        $grid->filter(function ($filter) {
            // Remove the default id filter
            $filter->disableIdFilter();
            $filter->equal('application_id', 'Filter by Application')
                ->select(
                    Application::get_items_array()
                );
            $filter->equal('reminder_state', 'Filter by Reminder State')
                ->select([
                    'On' => 'On',
                    'Off' => 'Off',
                ]);
            $filter->equal('priority', 'Filter by Priority')
                ->select([
                    'Low' => 'Low',
                    'Medium' => 'Medium',
                    'High' => 'High',
                ]);
        });
        $grid->model()
            ->where($conditions)
            ->orderBy('id', 'desc');
        $grid->column('event_date', __('Event Date'))
            ->display(function ($t) {
                return Utils::my_date_time($t);
            })
            ->sortable();
        $grid->column('reminder_date', __('Reminder Date'))
            ->display(function ($t) {
                return Utils::my_date($t);
            })
            ->sortable();
        $grid->column('administrator_id', __('User'))
            ->display(function ($t) {
                return Administrator::find($t)->name;
            })
            ->sortable();
        $grid->column('application_id', __('Application'))
            ->display(function ($t) {
                $x = $this->application;
                if ($x == null) {
                    return '-';
                }
                return "#" . $x->application_number . " - " . $x->applicant_name;
            })
            ->sortable();
        $grid->column('reminder_state', __('Reminder State'))
            ->using([
                'On' => 'On',
                'Off' => 'Off',
            ], 'No')
            ->label([
                'Yes' => 'success',
                'No' => 'danger',
            ])
            ->sortable();
        $grid->column('priority', __('Priority'))
            ->using([
                'Low' => 'Low',
                'Medium' => 'Medium',
                'High' => 'High',
            ], 'Medium')
            ->label([
                'Low' => 'success',
                'Medium' => 'warning',
                'High' => 'danger',
            ])
            ->sortable();
        $grid->column('description', __('Description'))->hide();
        $grid->column('outcome', __('Outcome'))->hide();
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
        $show = new Show(Event::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('administrator_id', __('Administrator id'));
        $show->field('application_id', __('Application id'));
        $show->field('reminder_state', __('Reminder state'));
        $show->field('priority', __('Priority'));
        $show->field('event_date', __('Event date'));
        $show->field('reminder_date', __('Reminder date'));
        $show->field('description', __('Description'));
        $show->field('remind_beofre_days', __('Remind beofre days'));
        $show->field('users_to_notify', __('Users to notify'));
        $show->field('reminders_sent', __('Reminders sent'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Event());

        $form->hidden('administrator_id')->default(auth()->user()->id);

        $form->select('application_id', 'Select Application')->options(
            Application::get_items_array()
        )->rules('required');

        if (!$form->isEditing()) {
            $form->hidden('reminders_sent')->default('No');
        } else {
            $form->radio('reminders_sent', 'Re-Send Reminder')->options([
                'Yes' => 'Yes',
                'No' => 'No',
            ])->default('No')
                ->rules('required');
        }

        $form->hidden('reminder_state')->default('On');
        $form->textarea('description', 'Event Description')->rules('required');
        $form->datetime('event_date', __('Event Date'))->rules('required');
        $form->decimal('remind_beofre_days', __('Reminder Before Days'))
            ->rules('required')
            ->default(1);
        $form->radio('priority', 'Priority')->options([
            'Low' => 'Low',
            'Medium' => 'Medium',
            'High' => 'High',
        ])->default('Medium')
            ->rules('required');
        $form->multipleSelect('users_to_notify', 'Users to notify')->options(
            Administrator::where([])->pluck('name', 'id')
        )->rules('required');
        if ($form->isEditing()) {
            $form->textarea('Event outcome');
        }

        return $form;
    }
}
