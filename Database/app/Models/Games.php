<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Games extends Model
{
    protected $table = 'teams.games';
    protected $primaryKey = 'gameID';
}
