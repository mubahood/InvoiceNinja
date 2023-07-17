<?php

namespace App\Admin\Controllers;

use App\Models\CaseModel;
use App\Models\Location;
use App\Models\Offence;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Auth;

class CaseModelController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Cases';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new CaseModel());
        $grid->disableBatchActions();
        $grid->quickSearch('title')->placeholder('Search by title....');
        $grid->column('id', __('Case No.'))->sortable();
        $grid->column('created_at', __('Created'))
            ->display(function ($x) {
                return date('d M Y', strtotime($x));
            })->sortable();
        $grid->column('updated_at', __('Updated'))
            ->display(function ($x) {
                return date('d M Y', strtotime($x));
            })
            ->hide()
            ->sortable();
        $grid->column('reported_by', __('Reported'))
            ->display(function ($x) {
                if ($this->reporter == null) {
                    return "N/A";
                }
                return $this->reporter->name;
            })->sortable();
        $grid->column('district_id', __('District'))->display(function ($x) {
            if ($this->district == null) {
                return "N/A";
            }
            return $this->district->name;
        })
            ->hide()
            ->sortable();
        $grid->column('sub_county_id', __('Sub_county'))->display(function ($x) {
            if ($this->sub_county == null) {
                return "N/A";
            }
            return $this->sub_county->name_text;
        })
            ->hide()
            ->sortable();
        $grid->column('village', __('Village'))->hide();
        $grid->column('offences', __('Offences'))
            ->hide()
            ->label();
        $grid->column('category', __('Category'))
            ->label([
                'PAYE' => 'danger',
                'INCOME TAX' => 'success',
                'VAT' => 'info',
                'CUSTOMS' => 'primary',
                'OTHERS' => 'warning',
            ])->filter([
                'PAYE' => 'PAYE',
                'INCOME TAX' => 'INCOME TAX',
                'VAT' => 'VAT',
                'CUSTOMS' => 'CUSTOMS',
                'OTHERS' => 'OTHERS',
            ]);
        $grid->column('title', __('Title'))->sortable();
        $grid->column('complainant_type', __('Complainant type'))
            ->dot([
                'Individual' => 'danger',
                'Company' => 'success',
                'URA' => 'info',
            ])->filter([
                'Individual' => 'Individual',
                'Company' => 'Company',
                'URA' => 'URA',
            ]);
        $grid->column('suspect_type', __('Suspect'))
            ->dot([
                'Individual' => 'danger',
                'Company' => 'success',
            ])->filter([
                'Individual' => 'Individual',
                'Company' => 'Company',
            ]);
        $grid->column('suspect_name', __('Suspect name'))->sortable();
        $grid->column('suspect_nin', __('Suspect nin'))->hide();
        $grid->column('suspect_sex', __('Suspect sex'))->hide();
        $grid->column('suspect_photo', __('Suspect photo'))->hide();
        $grid->column('suspect_phone_number', __('Suspect phone number'))->hide();
        $grid->column('suspect_occupation', __('Suspect occupation'))->hide();
        $grid->column('suspect_address', __('Suspect address'))->hide();
        $grid->column('other_suspects_suspects', __('Other suspects suspects'))->hide();
        $grid->column('suspect_company_name', __('Suspect Company'))->sortable();
        $grid->column('suspect_company_reg_number', __('Suspect Company Reg number'))->sortable();
        $grid->column('suspect_company_phone_number', __('Suspect Company Phone Number'))->hide();
        $grid->column('suspect_company_address', __('Suspect company address'))->hide();
        $grid->column('suspect_company_details', __('Suspect company details'))->hide();
        $grid->column('other_company_suspects', __('Other company suspects'))->hide();
        $grid->column('complainant_name', __('Complainant name'))->hide();
        $grid->column('complainant_nin', __('Complainant nin'))->hide();
        $grid->column('complainant_sex', __('Complainant sex'))->hide();
        $grid->column('complainant_phone_number', __('Complainant Phone Number'))->hide();
        $grid->column('complainant_occupation', __('Complainant Occupation'))->hide();
        $grid->column('complainant_address', __('Complainant Address'))->hide();
        $grid->column('complainant_company_name', __('Complainant company name'))->hide();
        $grid->column('complainant_company_reg_number', __('Complainant company reg number'))->hide();
        $grid->column('complainant_company_phone_number', __('Complainant company phone number'))->hide();
        $grid->column('complainant_company_address', __('Complainant company address'))->hide();
        $grid->column('complainant_company_details', __('Complainant company details'))->hide();
        $grid->column('case_number', __('Case Number'))->sortable();
        $grid->column('case_date', __('Case Opening Date'))->sortable();
        $grid->column('case_description', __('Case description'));
        $grid->column('officer_in_charge', __('Officer in charge'));
        $grid->column('is_suspects_arrested', __('Is suspects arrested'));
        $grid->column('arrest_date_time', __('Arrest date time'));
        $grid->column('police_station', __('Police station'));
        $grid->column('arrest_crb_number', __('Arrest crb number'));
        $grid->column('prosecutor', __('Prosecutor'));
        $grid->column('is_convicted', __('Is Convicted'));
        $grid->column('court_outcome', __('Court outcome'));
        $grid->column('magistrate_name', __('Magistrate Name'))->sortable();
        $grid->column('court_name', __('Court name'));
        $grid->column('court_file_number', __('Court file number'));
        $grid->column('is_jailed', __('Is jailed'));
        $grid->column('jail_period', __('Jail period'));
        $grid->column('is_fined', __('Is fined'));
        $grid->column('fined_amount', __('Fined amount'));
        $grid->column('court_date', __('Court date'));
        $grid->column('jail_date', __('Jail date'));
        $grid->column('court_action', __('Court action'));
        $grid->column('has_suspect_appeared_in_court', __('Has suspect appeared in court'));
        $grid->column('has_suspect_been_arrested', __('Has suspect been arrested'));
        $grid->column('court_police_action', __('Court police action'));
        $grid->column('prison', __('Prison'));
        $grid->column('cautioned', __('Cautioned'));
        $grid->column('cautioned_remarks', __('Cautioned remarks'));

        $grid->column('status', __('Status'));
        $grid->column('status_remarks', __('Status remarks'));
        $grid->column('state', __('State'));



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
        $show = new Show(CaseModel::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('reported_by', __('Reported by'));
        $show->field('district_id', __('District id'));
        $show->field('sub_county_id', __('Sub county id'));
        $show->field('village', __('Village'));
        $show->field('offences', __('Offences'));
        $show->field('category', __('Category'));
        $show->field('title', __('Title'));
        $show->field('case_type', __('Case type'));
        $show->field('complainant_type', __('Complainant type'));
        $show->field('suspect_type', __('Suspect type'));
        $show->field('suspect_name', __('Suspect name'));
        $show->field('suspect_nin', __('Suspect nin'));
        $show->field('suspect_sex', __('Suspect sex'));
        $show->field('suspect_photo', __('Suspect photo'));
        $show->field('suspect_phone_number', __('Suspect phone number'));
        $show->field('suspect_occupation', __('Suspect occupation'));
        $show->field('suspect_address', __('Suspect address'));
        $show->field('other_suspects_suspects', __('Other suspects suspects'));
        $show->field('suspect_company_name', __('Suspect company name'));
        $show->field('suspect_company_reg_number', __('Suspect company reg number'));
        $show->field('suspect_company_phone_number', __('Suspect company phone number'));
        $show->field('suspect_company_address', __('Suspect company address'));
        $show->field('suspect_company_details', __('Suspect company details'));
        $show->field('other_company_suspects', __('Other company suspects'));
        $show->field('complainant_name', __('Complainant name'));
        $show->field('complainant_nin', __('Complainant nin'));
        $show->field('complainant_sex', __('Complainant sex'));
        $show->field('complainant_photo', __('Complainant photo'));
        $show->field('complainant_phone_number', __('Complainant phone number'));
        $show->field('complainant_occupation', __('Complainant occupation'));
        $show->field('complainant_address', __('Complainant address'));
        $show->field('complainant_company_name', __('Complainant company name'));
        $show->field('complainant_company_reg_number', __('Complainant company reg number'));
        $show->field('complainant_company_phone_number', __('Complainant company phone number'));
        $show->field('complainant_company_address', __('Complainant company address'));
        $show->field('complainant_company_details', __('Complainant company details'));
        $show->field('status', __('Status'));
        $show->field('status_remarks', __('Status remarks'));
        $show->field('state', __('State'));
        $show->field('case_number', __('Case number'));
        $show->field('case_date', __('Case date'));
        $show->field('case_description', __('Case description'));
        $show->field('officer_in_charge', __('Officer in charge'));
        $show->field('is_suspects_arrested', __('Is suspects arrested'));
        $show->field('arrest_date_time', __('Arrest date time'));
        $show->field('police_station', __('Police station'));
        $show->field('arrest_crb_number', __('Arrest crb number'));
        $show->field('prosecutor', __('Prosecutor'));
        $show->field('is_convicted', __('Is convicted'));
        $show->field('court_outcome', __('Court outcome'));
        $show->field('magistrate_name', __('Magistrate name'));
        $show->field('court_name', __('Court name'));
        $show->field('court_file_number', __('Court file number'));
        $show->field('is_jailed', __('Is jailed'));
        $show->field('jail_period', __('Jail period'));
        $show->field('is_fined', __('Is fined'));
        $show->field('fined_amount', __('Fined amount'));
        $show->field('court_date', __('Court date'));
        $show->field('jail_date', __('Jail date'));
        $show->field('court_action', __('Court action'));
        $show->field('has_suspect_appeared_in_court', __('Has suspect appeared in court'));
        $show->field('has_suspect_been_arrested', __('Has suspect been arrested'));
        $show->field('court_police_action', __('Court police action'));
        $show->field('prison', __('Prison'));
        $show->field('cautioned', __('Cautioned'));
        $show->field('cautioned_remarks', __('Cautioned remarks'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new CaseModel());

        $form->tab('Case Information', function ($form) {

            $u = Auth::user();
            if ($form->isCreating()) {
                $form->hidden('reported_by', __('Reported by'))->default($u->id);
            }

            $form->divider(strtoupper('Case Basic Information'));

            $form->text('title', __('Case Title'))->rules('required');
            $form->date('case_date', __('Case Openning Date'))->default(date('Y-m-d'));
            $form->text('officer_in_charge', __('Officer in charge'))->rules('required');
            $form->text('case_number', __('Case Number'))->rules('required');
            $form->select('sub_county_id', __('Select Area Where Case Occured'))
                ->options(Location::get_sub_counties_array())
                ->rules('required');
            $form->text('village', __('Village'))->rules('required');

            $form->textarea('case_description', __('Case description'));
            $form->multipleSelect('offences', __('Offences'))
                ->options(Offence::all()
                    ->pluck('name', 'name'))
                ->rules('required');
            $form->radioCard('category', __('Category'))
                ->options([
                    'PAYE' => 'PAYE',
                    'INCOME TAX' => 'INCOME TAX',
                    'VAT' => 'VAT',
                    'CUSTOMS' => 'CUSTOMS',
                    'OTHERS' => 'OTHERS',
                ])->rules('required');
            $form->radioCard('complainant_type', __('Complainant'))
                ->options([
                    'Individual' => 'Individual',
                    'Company' => 'Company',
                    'URA' => 'URA'
                ])
                ->when('URA', function ($form) {

                    $form->divider(strtoupper('Suspect Details'));
                    $form->radio('suspect_type', __('Suspect '))
                        ->options([
                            'Individual' => 'Individual',
                            'Company' => 'Company',
                        ])
                        ->when('Individual', function ($form) {
                            $form->text('suspect_name', __('Suspect name'))->rules('required');
                            $form->radio('suspect_sex', __('Suspect sex'))
                                ->options([
                                    'Male' => 'Male',
                                    'Female' => 'Female',
                                ])
                                ->rules('required');
                            $form->text('suspect_nin', __('Suspect NIN'));
                            $form->text('suspect_phone_number', __('Suspect phone number'));
                            $form->text('suspect_occupation', __('Suspect occupation'));
                            $form->text('suspect_address', __('Suspect address'));
                            $form->image('suspect_photo', __('Suspect\'s Photo'))
                                ->removable();
                            $form->textarea('other_suspects_suspects', __('Other Suspects Involved'));
                        })->when('Company', function ($form) {
                            $form->text('suspect_company_name', __('Company name'))
                                ->rules('required');
                            $form->text('suspect_company_reg_number', __('Company Reg. Number'));
                            $form->text('suspect_company_phone_number', __('Company Contact'));
                            $form->text('suspect_company_address', __('Company Address'));
                            $form->text('suspect_company_details', __('Company Details'));
                            $form->textarea('other_company_suspects', __('Other companies involved'));
                        })
                        ->rules('required');

                    return $form;
                })
                ->when('Individual', function ($form) {
                    $form->divider(strtoupper('Individual Complainant Details'));
                    $form->text('complainant_name', __('Complainant name'))->rules('required');
                    $form->radio('complainant_sex', __('Complainant sex'))
                        ->options([
                            'Male' => 'Male',
                            'Female' => 'Female',
                        ])->rules('required');
                    $form->text('complainant_nin', __('Complainant NIN'));
                    $form->text('complainant_phone_number', __('Complainant phone number'));
                    $form->text('complainant_occupation', __('Complainant occupation'));
                    $form->text('complainant_address', __('Complainant address'));
                    $form->image('complainant_photo', __('Complainant Photo'))
                        ->removable();
                })
                ->when('Company', function ($form) {
                    $form->divider(strtoupper('Complainant Company Details'));
                    $form->text('complainant_company_name', __('Complainant Name'))
                        ->rules('required');
                    $form->text('complainant_company_reg_number', __('Company Reg. number'));
                    $form->text('complainant_company_phone_number', __('Company Contact'));
                    $form->text('complainant_company_address', __('Company Address'));
                    $form->textarea('complainant_company_details', __('Company Details'));
                })
                ->rules('required');

            $form->divider(strtoupper('ARREST INFOMATION'));

            $form->radioCard('is_suspects_arrested', __('Has suspect been arrested?'))
                ->options([
                    'Yes' => 'Yes',
                    'No' => 'No',
                ])
                ->when('Yes', function ($form) {
                    $form->date('arrest_date_time', __('Arrest Date'))->rules('required');
                    $form->text('police_station', __('Police Station'));
                    $form->text('arrest_crb_number', __('Arrest CRB number'));
                    $form->text('court_police_action', __('Court police action'));
                })
                ->rules('required');
            $form->divider(strtoupper('COURT INFOMATION'));

            $form->radioCard('has_suspect_appeared_in_court', __('Has this case been taken to court?'))
                ->options([
                    'Yes' => 'Yes',
                    'No' => 'No',
                ])
                ->when('Yes', function ($form) {
                    $form->date('court_date', __('Court date'));
                    $form->text('court_name', __('Court name'));
                    $form->text('court_file_number', __('Court file number'));
                    $form->text('prosecutor', __('Prosecutor Name'));
                    $form->text('magistrate_name', __('Magistrate name'));

                    $form->radio('court_action', 'Specific Court Case status')->options([
                        'On-going investigation' => 'On-going investigation',
                        'Dismissed' => 'Dismissed',
                        'Withdrawn by DPP' => 'Withdrawn by DPP',
                        'Acquittal' => 'Acquittal',
                        'Convicted' => 'Convicted',
                    ])
                        ->when('in', [
                            'On-going investigation' => 'On-going investigation',
                            'Dismissed' => 'Dismissed',
                            'Withdrawn by DPP' => 'Withdrawn by DPP',
                            'Acquittal' => 'Acquittal',
                        ], function ($form) {
                        })
                        ->when('Convicted', function ($form) {
                            $form->radio('is_jailed', __('Was Accused jailed?'))
                                ->options([
                                    "Yes" => 'Yes',
                                    "No" => 'No',
                                ])
                                ->when('Yes', function ($form) {
                                    $form->date('jail_date', 'Jail date');
                                    $form->decimal('jail_period', 'Jail period')->help("(In months)");
                                    $form->text('prison', 'Prison name');
                                });
                            $form->radio('is_fined', __('Was Accused fined?'))
                                ->options([
                                    'Yes' => 'Yes',
                                    'No' => 'No',
                                ])
                                ->when('Yes', function ($form) {
                                    $form->decimal('fined_amount', 'Fine amount')->help("(In UGX)");
                                });
                            $form->radio('cautioned', __('Was Accused cautioned?'))
                                ->options([
                                    'Yes' => 'Yes',
                                    'No' => 'No',
                                ])
                                ->when('Yes', function ($form) {
                                    $form->text('cautioned_remarks', 'Enter caution remarks');
                                });
                        });
                })->rules('required');

            $form->divider(strtoupper('CASE STATUS'));
            $form->radioCard('status', __('Status'))->options([
                'Pending' => 'Pending',
                'Open' => 'Open',
                'Closed' => 'Closed',
            ])->rules('required');
            $form->textarea('status_remarks', __('Status remarks'));
        })->tab('Case Attachments', function ($form) {
            $form->multipleFile('attachments', __('Attachments'))
                ->removable()
                ->sortable();
        });

        return $form;
    }
}
