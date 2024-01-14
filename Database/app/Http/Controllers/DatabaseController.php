<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;

class DatabaseController extends Controller
{
    public function checkConnection()
    {
        try {
            DB::connection()->getPdo();
            $connected = true;
        } catch (\Exception $e) {
            $connected = $e;
        }

        return response()->json(['connected' => $connected]);
    }
}
