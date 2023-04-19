<?php

namespace App\Admin\Controllers;

use App\Models\Event;
use App\Models\EventBooking;
use App\Models\Utils;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Form\Field\Radio;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Auth;

class EventBookingController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Event Bookings';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new EventBooking());
        $u = Auth::user();
        if (!$u->isRole('admin')) {
            $grid->model()->where(
                ['administrator_id' => $u->id]
            );
            $grid->disableCreateButton();
            $grid->disableTools();
            $grid->disableExport();
        }
        $grid->model()->orderBy('id', 'desc');
        $grid->disableBatchActions();


        $grid->column('created_at', __('Date'))->display(function ($t) {
            return Utils::my_date_time($t);
        });
        $grid->column('administrator_id', __('Booked by'))->display(function ($t) {
            return $this->booked_by->name;
        });
        $grid->column('event_id', __('Event id'))
            ->display(function ($t) {
                return $this->event->title;
            });
        $grid->column('event_ticket_id', __('Ticket'))
            ->display(function ($t) {
                return  number_format($this->event_ticket->price) . " - UGX " . $this->event_ticket->name;
            });
        $grid->column('is_paid', __('Is paid'))
            ->using([
                1 => 'Paid',
                0 => 'Not-paid',
            ], 'Not-paid')
            ->label([
                1 => 'success',
                0 => 'danger',
            ], 'danger');
        $grid->column('payment_approved', __('Payment approved'))
            ->using([
                1 => 'Approved',
                0 => 'Pending',
            ], 'Pending')
            ->label([
                1 => 'success',
                0 => 'danger',
            ], 'danger');
        $grid->column('ticket_approved', __('Ticket approved'))
            ->using([
                1 => 'Approved',
                0 => 'Pending',
            ], 'Pending')
            ->label([
                1 => 'success',
                0 => 'danger',
            ], 'danger');

        if ($u->isRole('admin')) {
            $grid->column('payment_method', __('Payment method'));
            $grid->column('payment_account', __('Payment account'));
            $grid->column('payment_transaction_id', __('Payment transaction id'));

            $grid->column('short_message', __('Short message'));
        };



        $grid->column('admin_message', __('Admin message'));

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
        $show = new Show(EventBooking::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('administrator_id', __('Administrator id'));
        $show->field('event_id', __('Event id'));
        $show->field('event_ticket_id', __('Event ticket id'));
        $show->field('is_paid', __('Is paid'));
        $show->field('payment_approved', __('Payment approved'));
        $show->field('payment_approved_by', __('Payment approved by'));
        $show->field('ticket_approved', __('Ticket approved'));
        $show->field('payment_method', __('Payment method'));
        $show->field('payment_account', __('Payment account'));
        $show->field('payment_transaction_id', __('Payment transaction id'));
        $show->field('short_message', __('Short message'));
        $show->field('admin_message', __('Admin message'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new EventBooking());
        $form->disableCreatingCheck();

        $event_id = 0;
        if (isset($_GET['event'])) {
            $event_id = ((int)($_GET['event']));
        }
        if (isset($_POST['event_id'])) {
            $event_id = ((int)($_POST['event_id']));
        }
        $eve = Event::find($event_id);

        if (!Auth::user()->isRole('admin')) {

            if ($eve == null) {
                return admin_error('Ooops!', 'Event not found.');
            }
            $tickets = [];
            foreach ($eve->tickets as $key => $v) {
                $tickets[$v->id] = $v->name . " - UGX " . number_format($v->price);
            }
            $u = Auth::user();
            $form->hidden('administrator_id', __('Administrator id'))->default($u->id);


            $form->select('event_id', __('Select Event'))
                ->options(function () {
                    return Event::all()->pluck('title', 'id');
                })->rules('required')
                ->readOnly()
                ->default($eve->id);

            $form->select('event_ticket_id', __('Select ticket category'))
                ->options($tickets)->rules('required');


            $form->radio('is_paid', 'Have you paid for this ticket?')->options([1 => 'Yes', 0 => 'No'])
                ->when(1, function ($f) {
                    $f->radio('payment_method', 'Which payment method did you use?')
                        ->options([
                            'Mobile money' => 'Mobile money',
                            'Bank' => 'Bank',
                            'Cash' => 'Cash',
                        ])
                        ->when('Mobile money', function ($f) {
                            $f->mobile('payment_account', 'Enter Phone number you used to send the money')->rules('required');
                            $f->text('payment_transaction_id', __('Payment transaction ID'))->rules('required');
                        })
                        ->when('Bank', function ($f) {
                            $f->text('payment_transaction_id', __('Payment transaction ID'))->rules('required');
                        })
                        ->when('Cash', function ($f) {
                            $f->text('payment_transaction_id', __('Receipt number'))->rules('required');
                        })
                        ->rules('required');
                })->rules('required');

            $form->divider();
            $form->textarea('short_message', __('Any short message?'));
        }
        return $form;
    }
}
