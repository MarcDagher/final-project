<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserPrompt extends Model
{
    use HasFactory;

    protected $hidden = [
        'user_id',
        'prompt'
    ];
}
