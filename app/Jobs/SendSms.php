<?php

namespace App\Jobs;

use App\helpers\Sms;
use App\Models\Common\SmsLogModel;
use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

class SendSms implements ShouldQueue
{
    use InteractsWithQueue, Queueable, SerializesModels;
    private $data;
    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($data)
    {
        $this->data = $data;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        if (Sms::sendYM($this->data['phone'], $this->data['content'])) {
            SmsLogModel::create($this->data);
        }
    }
}
