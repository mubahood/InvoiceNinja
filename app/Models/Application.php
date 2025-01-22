<?php

namespace App\Models;

use Carbon\Carbon;
use Exception;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Application extends Model
{
    use HasFactory;

    public static function get_items_array()
    {
        $items = [];
        foreach (Application::all() as $item) {
            $items[$item->id] = "#" . $item->application_number . " - " . $item->applicant_name;
        }
        return $items;
    }
    public function attarchments()
    {
        return $this->hasMany(Attarchment::class);
    }
    public function events()
    {
        return $this->hasMany(Event::class);
    }

    public static function boot()
    {
        parent::boot();
        self::creating(function ($m) {
            $m->stage = 'Draft';
            if ($m->ready_to_submit == 'Yes') {
                if ($m->ready_to_submit_confirm == 'Yes') {
                    $m->stage = 'Pending';
                }
            }
            //application_number
            $year = date('Y');
            $id = $m->id;
            $application_number = "TAT/UG/" . $year . "/" . str_pad($id, 5, '0', STR_PAD_LEFT);
            $m->application_number = $application_number;
            return Application::my_update($m);
        });
        self::updating(function ($m) {
            if ($m->stage == 'Defence') {
                if ($m->has_ura_submitted_defence != 'Yes') {
                    $m->has_ura_submitted_defence = 'No';
                    if ($m->ura_defence_submition_confirmation_1 == 'Yes') {
                        if ($m->ura_defence_submition_confirmation_2 == 'Yes') {
                            $m->has_ura_submitted_defence = 'Yes';
                            $m->is_ura_defence_submitted_email_sent = 'No';
                        }
                    }
                }

                if ($m->confirmed_panel_allocation_1 == 'Yes' && $m->confirmed_panel_allocation_2 == 'Yes') {
                    if ($m->schedule_date != null && strlen($m->schedule_date) > 5) {
                        $m->stage = 'Scheduled';
                    }
                }
            }
            if ($m->stage == 'Draft') {
                if ($m->ready_to_submit == 'Yes') {
                    if ($m->ready_to_submit_confirm == 'Yes') {
                        $m->stage = 'Pending';
                    }
                }
            }
            if ($m->application_number == null || strlen($m->application_number) < 4) {
                $year = date('Y');
                $id = $m->id;
                $application_number = "TAT/UG/" . $year . "/" . str_pad($id, 5, '0', STR_PAD_LEFT);
                $m->application_number = $application_number;
            }



            return Application::my_update($m);
        });

        //updated
        self::updated(function ($m) {
            if ($m->stage == 'Pending') {
                Application::send_mails_for_pending_application($m);
            }
            if ($m->stage == 'Defence') {
                if ($m->is_ura_defence_submitted_email_sent != 'Yes') {
                    if ($m->has_ura_submitted_defence == 'Yes') {
                        Application::notify_registrar_how_ura_has_submitted_defence($m);
                    }
                }
            }
            if ($m->stage == 'Scheduled') {
                if ($m->is_schedule_email_sent != 'Yes') {
                    Application::send_schedule_email($m);
                }
            }
        });

        //created
        self::created(function ($m) {
            if ($m->stage == 'Pending') {
                Application::send_mails_for_pending_application($m);
            }
        });
    }

    public static function send_schedule_email($application)
    {
        if ($application == null) {
            return;
        }
        if ($application->is_schedule_email_sent == 'Yes') {
            return;
        }
        if ($application->stage != 'Scheduled') {
            return;
        }

        $applicant = User::find($application->user_id);
        $schedule_date = $application->schedule_date;
        $link = url('applications-scheduled/' . $application->id . '/edit');
        if ($applicant != null) {
            //notify the applicant how application has been scheduled for conference. request applicant to submit witnesses
            $from = "Deputy Registrar" . " - TAT.";
            $body =
                <<<EOD
            <p>Dear <b>{$applicant->name}</b>,</p>
            <p>Your application {$application->application_number} has been scheduled for conference on <b>{$schedule_date}</b>. Please submit your witnesses before the conference date.</p>
            <p>Click on this link to <a href="{$link}">Submit Witnesses</a>.</p>
            <p>Best regards,</p>
            <p>{$from}</p>
            EOD;
            $data['body'] = $body;
            $data['data'] = $data['body'];
            $data['name'] = $application->applicant_name;
            $data['email'] = $applicant->email;
            $data['subject'] = 'Application Scheduled - ' . $application->application_number . ".";
            try {
                Utils::mail_sender($data);
            } catch (\Throwable $th) {
                $msg = $th->getMessage();
            }
        }
        $emails = Utils::get_emails_for_role('ura');
        if (count($emails) < 1) {
            return;
        }
        //mail to URA to submit witnesses
        $from = 'Deputy Registrar' . " - TAT.";
        $mail_body =
            <<<EOD
        <p>Dear <b>BOARD SECRETARY - URA</b>,</p>
        <p>You are requested to submit your witnesses on the application {$application->application_number} submitted by <b>{$application->applicant_name}</b> before the conference date <b>{$schedule_date}</b>. Please review the application and take the necessary action.</p>
        <p>Click on this link to <a href="{$link}">Submit Witnesses</a>.</p>
        <p>Best regards,</p>
        <p>{$from}</p>
        EOD;
        $mail_data['body'] = $mail_body;
        $mail_data['data'] = $mail_data['body'];
        $mail_data['name'] = 'BOARD SECRETARY - URA';
        $mail_data['email'] = $emails;
        $mail_data['subject'] = 'Application Scheduled - ' . $application->application_number . ".";
        try {
            Utils::mail_sender($mail_data);
        } catch (\Throwable $th) {
            $msg = $th->getMessage();
        }
        $application->is_schedule_email_sent = 'Yes';
        $application->save();
    }

    public static function my_update($m)
    {
        return $m;
    }

    //pannel
    public function pannels()
    {
        return $this->belongsToMany(User::class, 'application_has_panels');
    }


    public static function notify_registrar_how_ura_has_submitted_defence($application)
    {
        if ($application == null) {
            return;
        }
        if ($application->is_ura_defence_submitted_email_sent == 'Yes') {
            return;
        }
        if ($application->has_ura_submitted_defence != 'Yes') {
            return;
        }
        $emails = Utils::get_emails_for_role('admin');
        if (count($emails) < 1) {
            return;
        }
        $applicant = User::find($application->user_id);
        if ($applicant != null) {
            //notify the applicant how application defence has been submited by URA
            $body =
                <<<EOD
            <p>Dear <b>{$applicant->name}</b>,</p>
            <p>URA has submitted defence on your application {$application->application_number}. You will be notified once the board selects the panel.</p>
            <p>Best regards,</p>
            <p>Deputy Registrar - TAT.</p>
            EOD;
            $data['body'] = $body;
            $data['data'] = $data['body'];
            $data['name'] = $application->applicant_name;
            $data['email'] = $applicant->email;
            $data['subject'] = 'URA has submitted defence - ' . $application->application_number . ".";
            try {
                Utils::mail_sender($data);
            } catch (\Throwable $th) {
                $msg = $th->getMessage();
            }
        }
        //notify the registrar how URA has submitted defence
        $from = env('APP_NAME') . " - TAT MIS.";
        $mail_body =
            <<<EOD
        <p>Dear <b>Rgistrar</b>,</p>
        <p>URA has submitted defence on the application {$application->application_number} submitted by <b>{$application->applicant_name}</b>. Please review the application and take the necessary action.</p>
        <p>Best regards,</p>
        <p>{$from}</p>
        EOD;
        $date = date('Y-m-d');
        $data['body'] = $mail_body;
        $data['data'] = $data['body'];
        $data['name'] = $application->applicant_name;
        $data['email'] = $emails;
        $data['subject'] = 'Defence Submitted by URA - ' . $application->application_number . ".";
        try {
            Utils::mail_sender($data);
            $_data['is_ura_defence_submitted_email_sent'] = "Yes";
            DB::table('applications')->where('id', $application->id)->update($_data);
        } catch (\Throwable $th) {
            $msg = $th->getMessage();
            $_data['has_errors'] = "Yes";
            $_data['errors'] = $msg;
            DB::table('applications')->where('id', $application->id)->update($_data);
        }
    }
    public static function notify_ura_to_submit_defence($application)
    {
        if ($application == null) {
            return;
        }
        if ($application->is_ura_defence_email_sent == 'Yes') {
            return;
        }

        $emails = Utils::get_emails_for_role('ura');
        if (count($emails) < 1) {
            return;
        }

        $applicant = User::find($application->user_id);
        if ($applicant != null) {
            //notify the applicant how application has been submited to URA for defence
            $from = "Deputy Registrar" . " - TAT.";
            $mail_body =
                <<<EOD
            <p>Dear <b>{$applicant->name}</b>,</p>
            <p>Your application {$application->application_number} has been submitted to URA for defence. You will be notified once URA submits their defence.</p>
            <p>Best regards,</p>
            <p>{$from}</p>
            EOD;
            $date = date('Y-m-d');
            $data['body'] = $mail_body;
            $data['data'] = $data['body'];
            $data['name'] = $application->applicant_name;
            $data['email'] = $emails;
            $data['subject'] = 'Application submitted to URA for defence - ' . $application->application_number . ".";
            try {
                Utils::mail_sender($data);
            } catch (\Throwable $th) {
                $msg = $th->getMessage();
            }
        }

        //add 30 days to reminder_date
        $now = Carbon::now();
        $reminder_date = $now->addDays(30);
        $_data['should_ura_submit_defence'] = "Yes";
        $_data['reminder_date'] = date('Y-m-d', strtotime($reminder_date));

        $date_text = Utils::my_date($reminder_date);
        $review_link = url('applications-filing/' . $application->id . '/edit');
        $from = 'Deputy Registrar' . " - TAT.";
        $mail_body =
            <<<EOD
        <p>Dear <b>BOARD SECRETARY - URA</b>,</p>
        <p>You are requested to submit your defence on the application {$application->application_number} submitted by <b>{$application->applicant_name}</b> before <b>{$date_text}</b>. Please review the application and take the necessary action.</p>
        <p>Click on this link to <a href="{$review_link}">Submit Defence</a>.</p>
        <p>Best regards,</p>
        <p>{$from}</p>
        EOD;
        $date = date('Y-m-d');
        $data['body'] = $mail_body;
        $data['data'] = $data['body'];
        $data['name'] = $application->applicant_name;
        $data['email'] = $emails;
        $data['subject'] = 'Defence Submission Request - ' . $application->application_number . ".";
        try {
            Utils::mail_sender($data);
            $_data['is_ura_defence_email_sent'] = "Yes";
            DB::table('applications')->where('id', $application->id)->update($_data);
        } catch (\Throwable $th) {
            $msg = $th->getMessage();
            $_data['has_errors'] = "Yes";
            $_data['errors'] = $msg;
            DB::table('applications')->where('id', $application->id)->update($_data);
        }
    }
    public static function send_mails_for_pending_application($application)
    {
        if ($application == null) {
            return;
        }
        if ($application->is_submition_email_sent == 'Yes') {
            return;
        }
        $emails = Utils::get_emails_for_role('admin');
        if (count($emails) < 1) {
            return;
        }

        $review_link = url('applications-filing/' . $application->id . '/edit');
        $from = env('APP_NAME') . " - MIS.";
        $mail_body =
            <<<EOD
        <p>Dear <b>Registry</b>,</p>
        <p>A new application has been submitted by <b>{$application->applicant_name}</b>. Please review the application and take the necessary action.</p>
        <p>Click on this link to <a href="{$review_link}">Review The Application</a>.</p>
        <p>Best regards,</p>
        <p>{$from}</p>
        EOD;

        $date = date('Y-m-d');

        $data['body'] = $mail_body;
        $data['data'] = $data['body'];
        $data['name'] = $application->applicant_name;
        $data['email'] = $emails;
        $data['subject'] = 'New Application Submitted - ' . env('APP_NAME') . " - " . $date . ".";
        try {
            Utils::mail_sender($data);
            $_data['is_submition_email_sent'] = "Yes";
            DB::table('applications')->where('id', $application->id)->update($_data);
        } catch (\Throwable $th) {
            $msg = $th->getMessage();
            $_data['has_errors'] = "Yes";
            $_data['errors'] = $msg;
            DB::table('applications')->where('id', $application->id)->update($_data);
        }
    }

    //getter for application_number
    public function getApplicationNumberAttribute($application_number)
    {
        if ($application_number == null || strlen($application_number) < 1) {
            $year = date('Y');
            $id = $this->id;
            $application_number = "TAT/UG/" . $year . "/" . str_pad($id, 5, '0', STR_PAD_LEFT);
            $update['application_number'] = $application_number;
            $update['year'] = $year;
            DB::table('applications')->where('id', $id)->update($update);
            return $application_number;
        }
        return $application_number;
    }
}
