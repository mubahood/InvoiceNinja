<?php

namespace App\Admin\Controllers;

use App\Models\Application;
use App\Models\Utils;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class ApplicationController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Application Forms';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Application());
        $grid->disableBatchActions();
        $current_segment = Utils::getCurrentSegment();

        $conditions = [];
        $u = auth()->user();
        if ($current_segment == 'my-applications') {
            $conditions['user_id'] = $u->id;
        }
        if ($u->isRole('basic-user')) {
            $conditions['user_id'] = $u->id;
        }

        $grid->model()
            ->where($conditions)
            ->orderBy('id', 'desc');
        $grid->column('created_at', __('Created'))
            ->display(function ($created_at) {
                return date('d-m-Y', strtotime($created_at));
            })
            ->sortable();

        $grid->actions(function ($actions) {
            if ($actions->row->stage != 'Pending') {

                $u = auth()->user();
                if ($u->isRole('basic-user')) {
                    $actions->disableEdit();
                    $actions->disableDelete();
                }
            }
        });



        $grid->filter(function ($filter) {

            $filter->equal('stage', 'Filte by Stage')
                ->select([
                    'Pending' => 'Pending',
                    'Hearing' => 'Waiting for hearing',
                    'Mediation' => 'Under mediation',
                    'Court' => 'In Court',
                    'Closed' => 'Closed',
                ]);
            $filter->between('created_at', 'Create Date')->date();
            //$filter->like('school_pay_payment_code', 'By school-pay code');

            // Remove the default id filter
            $filter->disableIdFilter();
        });



        $grid->column('application_number', __('Application Number'))->sortable();
        $grid->column('registry', __('Registry'))->sortable();
        $grid->column('year', __('Year'))->sortable();
        $grid->column('applicant', __('Applicant'))->sortable();
        $grid->column('respondent', __('Respondent'))->sortable();
        $grid->column('applicant_name', __('Applicant Name'))->sortable();
        $grid->column('nature_of_business', __('Nature of business'))->hide();
        $grid->column('postal_address', __('Postal address'))->hide();
        $grid->column('physical_address', __('Physical address'))->hide();
        $grid->column('plot_number', __('Plot number'))->hide();
        $grid->column('street', __('Street'))->hide();
        $grid->column('village', __('Village'))->hide();
        $grid->column('trading_center', __('Trading center'))->hide();
        $grid->column('telephone_number', __('Telephone number'))->hide();
        $grid->column('fax_number', __('Fax number'))->hide();
        $grid->column('email', __('Email'))->hide();
        $grid->column('tin', __('TIN'))->hide();
        $grid->column('income_tax_file_number', __('Income tax file number'))->hide();
        $grid->column('vat_number', __('Vat number'))->hide();
        $grid->column('tax_decision_office', __('Tax decision office'))->hide();
        $grid->column('tax_type', __('Tax type'))->hide();
        $grid->column('assessment_number', __('Assessment number'))->hide();
        $grid->column('bill_of_entry', __('Bill of entry'))->hide();
        $grid->column('bank_payment', __('Bank payment'))->hide();
        $grid->column('amount_of_tax', __('Amount of tax'))->hide();
        $grid->column('taxation_decision_date', __('Taxation decision date'))->hide();
        $grid->column('statement_of_facts', __('Statement of facts'))->hide();
        $grid->column('decision_issue', __('Decision issue'))->hide();
        $grid->column('list_of_books', __('List of books'))->hide();
        $grid->column('witness_names', __('Witness names'))->hide();
        $grid->column('dated_at', __('Dated at'))->hide();
        $grid->column('sign', __('Sign'))->hide();
        $grid->column('date_of_filling', __('Date of filling'));
        $grid->column('sign1', __('Sign1'))->hide();
        $grid->column('date2', __('Date2'))->hide();;
        $grid->column('sign2', __('Sign2'))->hide();
        $grid->column('stage', __('Stage'))->label([
            'Pending' => 'info',
            'Hearing' => 'primary',
            'Mediation' => 'warning',
            'Court' => 'success',
            'Closed' => 'primary',
        ]);
        $grid->column('reminder_state', __('Reminder State'))->label([
            'On' => 'success',
            'Off' => 'info',
        ]);
        $grid->column('reminder_date', __('Reminder date'))->hide();

        $grid->column('print', __('PRINT'))->display(function () {
            $link = url('print?id=' . $this->id);
            return '<b><a target="_blank" href="' . $link . '">PRINT</a></b>';
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
        $show = new Show(Application::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('registry', __('Registry'));
        $show->field('application_number', __('Application number'));
        $show->field('year', __('Year'));
        $show->field('applicant', __('Applicant'));
        $show->field('respondent', __('Respondent'));
        $show->field('applicant_name', __('Applicant name'));
        $show->field('nature_of_business', __('Nature of business'));
        $show->field('postal_address', __('Postal address'));
        $show->field('physical_address', __('Physical address'));
        $show->field('plot_number', __('Plot number'));
        $show->field('street', __('Street'));
        $show->field('village', __('Village'));
        $show->field('trading_center', __('Trading center'));
        $show->field('telephone_number', __('Telephone number'));
        $show->field('fax_number', __('Fax number'));
        $show->field('email', __('Email'));
        $show->field('tin', __('Tin'));
        $show->field('income_tax_file_number', __('Income tax file number'));
        $show->field('vat_number', __('Vat number'));
        $show->field('tax_decision_office', __('Tax decision office'));
        $show->field('tax_type', __('Tax type'));
        $show->field('assessment_number', __('Assessment number'));
        $show->field('bill_of_entry', __('Bill of entry'));
        $show->field('bank_payment', __('Bank payment'));
        $show->field('amount_of_tax', __('Amount of tax'));
        $show->field('taxation_decision_date', __('Taxation decision date'));
        $show->field('statement_of_facts', __('Statement of facts'));
        $show->field('decision_issue', __('Decision issue'));
        $show->field('list_of_books', __('List of books'));
        $show->field('witness_names', __('Witness names'));
        $show->field('dated_at', __('Dated at'));
        $show->field('sign', __('Sign'))->hide();;
        $show->field('date_of_filling', __('Date of filling'));
        $show->field('sign1', __('Sign1'))->hide();
        $show->field('date2', __('Date2'))->hide();
        $show->field('sign2', __('Sign2'))->hide();

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Application());

        $form->tab('Case Information', function ($form) {
            $form->divider(strtoupper('FORM TAT 1'));
            $u = auth()->user();

            if ($u->isRole('basic-user')) {
                $form->hidden('user_id')->default($u->id);
                $form->hidden('stage')->default('Pending');
                $form->hidden('reminder_state')->default('Off');
                $form->hidden('reminder_days')->default(0);
                $form->hidden('reminder_message')->default('');
            } else {
                $form->select('user_id', __('User'))->options(\App\Models\User::all()->pluck('name', 'id'));
                $form->radioCard('stage', __('Case Stage'))
                    ->options([
                        'Pending' => 'Pending',
                        'Waiting for hearing' => 'Waiting for hearing',
                        'Under mediation' => 'Under mediation',
                        'In Court' => 'In Court',
                        'Closed' => 'Closed',
                    ])
                    ->default('APPLICATION')
                    ->rules('required');
                $form->radioCard('reminder_state', __('Set Reminder'))
                    ->options([
                        'On' => 'On',
                        'Off' => 'Off',
                    ])
                    ->when('On', function (Form $form) {
                        $form->decimal('reminder_days', __('Reminder After Days'))
                            ->rules('required')
                            ->default(0);
                        $form->textarea('reminder_message', __('Reminder Message'));
                    })
                    ->default('Off')
                    ->rules('required');
            }




            /* 
ALTER TABLE `applications` ADD `reminder_state` VARCHAR(45) NULL DEFAULT 'Off' AFTER `stage`, ADD `reminder_days` INT NULL DEFAULT '0' AFTER `reminder_state`, ADD `reminder_date` DATETIME NULL DEFAULT NULL AFTER `reminder_days`, ADD `reminder_message` TEXT NULL DEFAULT NULL AFTER `reminder_date`;

*/
            $form->text('registry', __('Registry'));
            $form->text('application_number', __('Application number'));
            $form->year('year', __('Year'))->default(date('Y-m-d'));
            $form->text('applicant', __('Applicant'));

            $form->divider(strtoupper('APPLICATION'));

            $form->text('respondent', __('Respondent'));
            $form->text('applicant_name', __('Applicant name'));
            $form->text('nature_of_business', __('Nature of business'));
            $form->text('postal_address', __('Postal address'));
            $form->text('physical_address', __('Physical address'));
            $form->text('plot_number', __('Plot number'));
            $form->text('street', __('Street'));
            $form->text('village', __('Village'));
            $form->text('trading_center', __('Trading center'));
            $form->text('telephone_number', __('Telephone number'));
            $form->text('fax_number', __('Fax number'));
            $form->text('email', __('Email'));
            $form->text('tin', __('Tin'));
            $form->text('income_tax_file_number', __('Income tax file number'));
            $form->text('vat_number', __('Vat number'));

            $form->divider(strtoupper('PARTICULARS OF THE TAX DISPUTE'));

            $form->text('tax_decision_office', __('Tax decision office'));
            $form->radioCard('tax_type', __('Tax type'))
                ->options([
                    'INCOME TAX' => 'INCOME TAX',
                    'EXCISE DUTY' => 'EXCISE DUTY',
                    'IMPORT COMMISION' => 'IMPORT COMMISION',
                    'OTHERS' => 'OTHERS',
                    'IMPORT DUTY' => 'IMPORT DUTY',
                    'WITHHOLDING TAX' => 'WITHHOLDING TAX',
                    'VAT' => 'VAT',
                ]);


            $form->text('assessment_number', __('Assessment number'));
            $form->text('bill_of_entry', __('Bill of entry'));
            $form->text('bank_payment', __('Bank payment'));
            $form->text('amount_of_tax', __('Amount of tax'));
            $form->text('taxation_decision_date', __('Taxation decision date'));

            $form->divider(strtoupper('STATEMENT OF FACT AND REASON IN SUPPORT OF THE APPLICATION'));

            $form->textarea('statement_of_facts', __('Statement of facts'));

            $form->divider(strtoupper('ISSUE(S) ON WHICH A DECISION(S)IS /ARE SOUGHT'));

            $form->textarea('decision_issue', __('Decision issue'));
            $form->divider(strtoupper('LIST OF BOOKS, DOCUMENYS OR THINGS TO BE PRODUCED BEFORE THE TRIBUNAL,IF ANY.'));

            $form->textarea('list_of_books', __('List of books'));
            $form->divider(strtoupper('NAMES OF THE WITNESSSES IF ANY, AND THEIR ADDRESS'));

            $form->textarea('witness_names', __('Witness names'));
            $form->divider(strtoupper('(FOR OFFICIAL USE))'));

            $form->date('dated_at', __('Dated at'));
            $form->image('sign', __('Sign'));
            $form->date('date_of_filling', __('Date of filling'))->default(date('Y-m-d'));
            $form->image('sign1', __('Sign'));
            $form->date('date2', __('Date'));
            $form->image('sign2', __('Sign'));
        })->tab('Case Attachments', function ($form) {
            $form->hasMany('attarchments', function (Form\NestedForm $form) {
                $form->text('description', 'Attachment Description');
                $form->file('file', __('File'))
                    ->removable()
                    ->downloadable();
            });
        })->tab('Events/Reminders', function ($form) {
            $form->hasMany('events', function (Form\NestedForm $form) {
                $form->hidden('administrator_id')->default(auth()->user()->id);

                if (!$form->isEditing()) {
                    $form->hidden('reminders_sent')->default('No');
                } else {
                    $form->radio('reminders_sent', 'Re-Send Reminder')->options([
                        'Yes' => 'Yes',
                        'No' => 'No',
                    ])->default('No')
                        ->rules('required');
                }

                $form->hidden('reminder_state')->default('Yes');
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
            });
        });

        /* 

        reminder_state
            $table->dateTime('reminder_date')->nullable();

        */

        return $form;
    }
}
