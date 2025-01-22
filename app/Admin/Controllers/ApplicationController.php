<?php

namespace App\Admin\Controllers;

use App\Admin\Actions\Application\AcionAddDefense;
use App\Admin\Actions\Application\AcionAddWitness;
use App\Admin\Actions\Application\AcionAllocatePanel;
use App\Admin\Actions\Application\UpdateApplicationStage;
use App\Models\Application;
use App\Models\Utils;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
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
    protected function title()
    {
        return Utils::getCurrentSegmentTitle();
    }


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
        $segs = Utils::getSegments();


        $conditions = [];
        $u = Admin::user();
        if (
            (!$u->isRole('admin')) &&
            (!$u->isRole('manager')) &&
            (!$u->isRole('ura'))
        ) {
            $conditions['user_id'] = $u->id;
        }

        if ($current_segment == 'applications-defense') {
            $conditions['stage'] = 'Defence';
        } else if ($current_segment == 'cases-pending') {
            $conditions['stage'] = 'Pending';
        } else if (Utils::hasSegment('applications-mention')) {
            $conditions['stage'] = 'Mention';
        } else if (Utils::hasSegment('applications-hearing')) {
            $conditions['stage'] = 'Hearing';
        } else if (Utils::hasSegment('applications-submission')) {
            $conditions['stage'] = 'Submission';
        } else if (Utils::hasSegment('applications-archived')) {
            $conditions['stage'] = 'Archived';
        } else if (Utils::hasSegment('applications-pending')) {
            $conditions['stage'] = 'Pending';
        } else if (Utils::hasSegment('applications-scheduled')) {
            $conditions['stage'] = 'Scheduled';
        }

        $grid->model()
            ->where($conditions)
            ->orderBy('id', 'desc');



        $grid->actions(function ($actions) use ($current_segment, $u) {
            /* 
                $actions->add(new AddArrest);
            */
            if ($current_segment == 'applications-defense') {
                $actions->disableEdit();
                $actions->disableDelete();
                if ($this->row->stage == 'Defence') {
                    if ($u->isRole('ura')) {
                        $actions->add(new AcionAddDefense);
                    }
                    if ($u->isRole('admin')) {
                        if ($this->row->has_ura_submitted_defence == 'Yes') {
                            $actions->add(new AcionAllocatePanel);
                        }
                    }
                }
            }

            if ($actions->row->stage != 'Pending') {
                $u = auth()->user();
                if (!$u->isRole('admin')) {
                    $actions->disableEdit();
                    $actions->disableDelete();
                }
            }
            if ($actions->row->stage == 'Scheduled') {
                $actions->disableEdit();
                $actions->disableDelete();
                $actions->add(new AcionAddWitness);
            }

            $accepted_stages = ['Scheduled'];

            if ($u->isRole('ura')) {
                if (in_array($this->row->stage, $accepted_stages)) {
                    $actions->add(new UpdateApplicationStage);
                }
            }
        });


        if (!$u->isRole('basic-user')) {
            $grid->disableCreateButton();
        }
        $grid->disableExport();
        $grid->quickSearch('application_number', 'applicant_name', 'telephone_number', 'nature_of_business', 'tax_type', 'stage')
            ->placeholder('Search by application number, applicant name, telephone number, nature of business, tax type, stage');


        $grid->column('created_at', __('Created'))
            ->display(function ($created_at) {
                return date('d-m-Y', strtotime($created_at));
            })
            ->sortable();





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
        $grid->column('applicant_name', __('Applicant'))->sortable();
        $grid->column('telephone_number', __('Applicant Contact'))->sortable();

        $grid->column('tax_type', __('Tax Type'))
            ->dot([
                'INCOME TAX' => 'primary',
                'EXCISE DUTY' => 'success',
                'IMPORT COMMISION' => 'warning',
                'OTHERS' => 'info',
                'IMPORT DUTY' => 'danger',
                'WITHHOLDING TAX' => 'primary',
                'VAT' => 'success',
            ])->sortable();

        $grid->column('nature_of_business', __('Nature of business'))->sortable()->hide();

        //stage
        $grid->column('stage', __('Stage'))->label([
            'Pending' => 'info',
            'Hearing' => 'warning',
            'Mediation' => 'success',
            'Court' => 'danger',
            'Closed' => 'success',
        ])->sortable();

        $grid->column('registry', __('Registry'))->sortable()->hide();
        $grid->column('year', __('Year'))->sortable()->hide();
        $grid->column('postal_address', __('Postal address'))->hide();
        $grid->column('physical_address', __('Physical address'))->hide();
        $grid->column('plot_number', __('Plot number'))->hide();
        $grid->column('street', __('Street'))->hide();
        $grid->column('village', __('Village'))->hide();
        $grid->column('trading_center', __('Trading center'))->hide();
        $grid->column('fax_number', __('Fax number'))->hide();
        $grid->column('email', __('Email'))->hide();
        $grid->column('tin', __('TIN'))->hide();
        $grid->column('income_tax_file_number', __('Income tax file number'))->hide();
        $grid->column('vat_number', __('Vat number'))->hide();
        $grid->column('tax_decision_office', __('Tax decision office'))->hide();
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
        $grid->column('date_of_filling', __('Date of filling'))->hide();

        if ($current_segment == 'applications-defense') {
            //reminder_date
            $grid->column('reminder_date', __('Submission Deadline'))
                ->display(function ($reminder_date) {
                    try {
                        $class = 'badge badge-';
                        $now = date('Y-m-d');
                        $days_diff = date_diff(date_create($reminder_date), date_create($now));
                        $days = $days_diff->format('%R%a');
                        $days = (int)$days;
                        if ($days < 500) {
                            $class .= 'danger';
                        } else if ($days == 10) {
                            $class .= 'warning';
                        } else {
                            $class .= 'success';
                        }
                        return "<span class='$class'>" . Utils::my_date($reminder_date) . "</span>";
                    } catch (\Throwable $th) {
                        return $reminder_date;
                    }
                })->sortable();
            $grid->column('has_ura_submitted_defence', __('Has URA Submitted Sefence?'))
                ->label([
                    'Yes' => 'success',
                    'No' => 'danger',
                ])->sortable()
                ->filter([
                    'Yes' => 'Yes',
                    'No' => 'No',
                ]);
        } else if ($current_segment == 'applications-scheduled') {
            //has_ura_submitted_witnesses
            $grid->column('has_ura_submitted_witnesses', __('Has URA Submitted Witnesses?'))
                ->dot([
                    'Yes' => 'success',
                    'No' => 'danger',
                ])->sortable()
                ->filter([
                    'Yes' => 'Yes',
                    'No' => 'No',
                ]);
            //has_applicant_submitted_witnesses
            $grid->column('has_applicant_submitted_witnesses', __('Has Applicant Submitted Witnesses?'))
                ->dot([
                    'Yes' => 'success',
                    'No' => 'danger',
                ])->sortable()
                ->filter([
                    'Yes' => 'Yes',
                    'No' => 'No',
                ]);
            //schedule_date
            $grid->column('schedule_date', __('Conference Scheduled Date'))
                ->display(function ($schedule_date) {
                    return Utils::my_date($schedule_date);
                })->sortable();
            $grid->column('print', __('Print'))
                ->display(function ($schedule_date) {
                    $url = url('print?id=' . $this->id);
                    return '<a target="_blank" href="' . $url . '">Print/Download</a>';
                })->sortable();
        }

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
        $form->disableCreatingCheck();
        $u = Admin::user();
        $current_seg = Utils::getCurrentSegment();


        if ($form->isCreating()) {
            if (!$u->isRole('basic-user')) {
                admin_error('Error', 'You are not allowed to create applications.');
                return redirect('applications');
            }
            $draft = Application::where('user_id', $u->id)->where('stage', 'Draft')->first();
            if ($draft != null) {
                $url = url('applications/' . $draft->id . '/edit');
                admin_error('Error', 'You have a draft application. Please submit it first <a href="' . $url . '">Click here to edit the draft form.</a>');
                return redirect('applications');
            }
            $form->hidden('user_id')->default($u->id);
        }

        if ($form->isEditing()) {
            $form->divider(strtoupper('APPLICANT INFORMATION'));
            $form->display('applicant_name', __('Name of applicant'));
            $form->display('nature_of_business', __('Nature of business'));
            $form->display('physical_address', __('Physical address'));
            $form->display('stage', __('stage'));
            $form->display('telephone_number', __('Applicant\'s Contact'));
            $app_id = request()->segment(2);
            $application = Application::find($app_id);
            if ($current_seg == 'applications-filing') {
                if ($application != null) {
                    $url = url('applications/' . $app_id);
                    $form->html('<a class="btn btn-info" href="' . $url . '">Click here to View Full Application Details</a>', 'View Full Application Details');
                    if ($application->stage == 'Pending') {
                        if ($u->isRole('admin')) {
                            $form->divider(strtoupper('REVIEW APPLICATION'));
                            $form->radio('rejected', __('Review Application'))
                                ->options([
                                    'No' => 'Approve Application',
                                    'Yes' => 'Reject Application',
                                ])->required()
                                ->help('By approving this application, you are confirming that the application should proceed to URA to submit defence.')
                                ->when('Yes', function (Form $form) {
                                    $form->textarea('rejection_reason', __('Enter reason for rejection'))->rules('required');
                                })
                                ->when('No', function (Form $form) {
                                    $form->radio('stage', __('Stage'))
                                        ->options([
                                            'Defence' => 'Continue to URA Defence (Accept Application)',
                                            'Pending' => 'Keep Pending',
                                        ])->rules('required');
                                });
                            return $form;
                        }
                    }
                }
                return $form;
            } else if ($current_seg == 'applications-defense') {
                if ($application != null) {

                    if ($u->isRole('ura')) {
                        $form->divider(strtoupper('URA DEFENCE SUBMISSION'));
                        //ura_defence_attachment
                        if ($application->stage == 'Defence') {
                            $form->file('ura_defence_attachment', __('Attach URA Defence'))
                                ->help('Attach the URA defence document here.')->required()
                                ->rules('required');

                            $form->radio('ura_defence_submition_confirmation_1', __('Mark as submitted'))
                                ->options([
                                    'Yes' => 'Yes, (Mark as submitted)',
                                    'No' => 'No, (Save as draft and submit later)',
                                ])->required()
                                ->when('Yes', function (Form $form) {
                                    $form->radio('ura_defence_submition_confirmation_2', __('Are you sure you want to submit this defence?'))
                                        ->options([
                                            'Yes' => 'Yes, (SUBMIT NOW)',
                                            'No' => 'No, (SAVE AS DRAFT)',
                                        ])->rules('required');
                                });

                            if ($application->has_ura_submitted_defence == 'Yes') {
                                $form->divider(strtoupper('PANEL ALLOCATION'));
                                $users = Utils::get_tat_members();
                                $_users = $users->pluck('name', 'id');


                                $form->listbox('pannels', 'Select Panel Members')
                                    ->options($_users)
                                    ->help("Select the panel members to allocate to this application.")
                                    ->rules('required')
                                    ->required();
                                //schedule_date
                                $form->date('schedule_date', __('Schedule Date for Conference'))
                                    ->help('Select the date for the conference.')
                                    ->rules('required')
                                    ->required();

                                $form->radio('confirmed_panel_allocation_1', __('Confirm Panel Allocation'))
                                    ->options([
                                        'Yes' => 'Yes, (Confirm Panel Allocation)',
                                        'No' => 'No, (Save as draft)',
                                    ])->required()
                                    ->when('Yes', function (Form $form) {
                                        $form->radio('confirmed_panel_allocation_2', __('Are you sure you want to confirm this panel allocation?'))
                                            ->options([
                                                'Yes' => 'Yes, (CONFIRM NOW)',
                                                'No' => 'No, (SAVE AS DRAFT)',
                                            ])->rules('required');
                                    });
                            }
                        }

                        return $form;
                    }

                    return $form;
                }
            } else if ($current_seg == 'applications-scheduled') {
                if ($application != null) {
                    if ($application->stage == 'Scheduled') {
                        $form->divider(strtoupper('WITNESS SUBMISSION'));
                        if ($u->isRole('basic-user')) {
                            $form->textarea('applicant_witnesses', __('Enter witnesses names'))->required()->rules('required');
                            $form->radio('applicant_confirm_witnesses_submission', __('Confirm Witness Submission'))
                                ->options([
                                    'Yes' => 'Yes',
                                    'No' => 'No',
                                ])->required()
                                ->when('Yes', function (Form $form) {
                                    $form->radio('has_applicant_submitted_witnesses', __('Are you sure you want to submit witnesses?'))
                                        ->options([
                                            'Yes' => 'Yes, (SUBMIT NOW)',
                                            'No' => 'No, (SAVE AS DRAFT)',
                                        ])->rules('required');
                                });
                        }
                        if ($u->isRole('ura')) {
                            $form->textarea('ura_witnesses', __('Enter witnesses names'))->required()->rules('required');
                            $form->radio('ura_confirm_witnesses_submission', __('Confirm Witness Submission'))
                                ->options([
                                    'Yes' => 'Yes',
                                    'No' => 'No',
                                ])->required()
                                ->when('Yes', function (Form $form) {
                                    $form->radio('has_ura_submitted_witnesses', __('Are you sure you want to submit witnesses?'))
                                        ->options([
                                            'Yes' => 'Yes, (SUBMIT NOW)',
                                            'No' => 'No, (SAVE AS DRAFT)',
                                        ])->rules('required');
                                });
                        }
                        return $form;
                    }
                }
                return $form;
            }


            $u = Admin::user();
            if ($application != null) {


                if ($u->isRole('admin')) {
                    $form->divider(strtoupper('UPDATE APPLICATION STAGE'));
                    $form->radio('stage', __('Stage'))
                        ->options([
                            'Pending' => 'Pending',
                            'Defence' => 'Awaiting for URA Defence',
                            'Mention' => 'Mention',
                            'Hearing' => 'Hearing',
                            'Submission' => 'Submission',
                            'Archived' => 'Archive/Close',
                        ])->required();
                }

                if ($u->id != $application->user_id) {
                    return $form;
                }

                if ($application->stage != 'Pending' && $application->stage != 'Draft') {
                    return $form;
                }
            }
        }


        $form->divider(strtoupper('APPLICANT INFORMATION'));
        $form->text('applicant_name', __('Name of applicant'))->default($u->name)->required();
        $form->text('nature_of_business', __('Nature of business'))->required();
        $form->text('postal_address', __('Postal address'));
        $form->text('physical_address', __('Physical address'))->required();
        $form->text('plot_number', __('Plot number'));
        $form->text('street', __('Street'));
        $form->text('village', __('Village'));
        $form->text('trading_center', __('Trading center'));
        $form->text('telephone_number', __('Telephone number'));
        $form->text('fax_number', __('Fax number'));
        $form->text('email', __('Email Address'))->required()->default($u->email);
        $form->text('tin', __('TIN'));
        $form->text('income_tax_file_number', __('Income tax file number'));
        $form->text('vat_number', __('Vat number'));


        $form->divider(strtoupper('PARTICULARS OF THE TAX DISPUTE'));
        $form->text('tax_decision_office', __('Tax decision office'))->required();
        $form->radio('tax_type', __('Tax type'))
            ->options([
                'INCOME TAX' => 'INCOME TAX',
                'EXCISE DUTY' => 'EXCISE DUTY',
                'IMPORT COMMISION' => 'IMPORT COMMISION',
                'OTHERS' => 'OTHERS',
                'IMPORT DUTY' => 'IMPORT DUTY',
                'WITHHOLDING TAX' => 'WITHHOLDING TAX',
                'VAT' => 'VAT',
            ])->required();


        $form->text('assessment_number', __('Assessment number'));
        $form->text('bill_of_entry', __('Bill of entry'));
        $form->text('bank_payment', __('Bank payment'));
        $form->decimal('amount_of_tax', __('Amount of tax (UGX)'))->required();
        $form->date('taxation_decision_date', __('Date of taxation decision'))->required();

        $form->divider(strtoupper('STATEMENT OF FACT AND REASON IN SUPPORT OF THE APPLICATION'));
        $form->quill('statement_of_facts', __('Statement of facts'));


        $form->divider(strtoupper('ISSUE(S) ON WHICH A DECISION(S)IS /ARE SOUGHT'));
        $form->quill('decision_issue', __('Decision issue'));
        $form->divider(strtoupper('LIST OF BOOKS, DOCUMENYS OR THINGS TO BE PRODUCED BEFORE THE TRIBUNAL,IF ANY.'));
        $form->quill('list_of_books', __('List of books'));
        $form->divider(strtoupper('NAMES OF THE WITNESSSES IF ANY, AND THEIR ADDRESS'));
        $form->quill('witness_names', __('Witness names'));
        $form->divider(strtoupper('REPRESENTATIVE INFORMATION'));
        $form->text('representative_name', __('Name of representative'));
        $form->text('representative_telephone', __('Telephone of representative'));
        $form->text('representative_mobile', __('Mobile of representative'));
        $form->text('representative_address', __('Address of representative'));
        $form->file('proof_of_payment', __('Attarch Proof of payment'));
        $form->radio('ready_to_submit', __('Is this application ready to submit?'))
            ->options([
                'Yes' => 'Yes',
                'No' => 'No, (SAVE AS DRAFT)',
            ])->required()
            ->when('Yes', function (Form $form) {
                $form->radio('ready_to_submit_confirm', __('Are you sure you want to submit this application?'))
                    ->options([
                        'Yes' => 'Yes, (SUBMIT NOW)',
                        'No' => 'No, (SAVE AS DRAFT)',
                    ]);
            });
        return $form;
    }
}
